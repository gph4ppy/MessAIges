//
//  PersistenceManager.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 06/04/2023.
//

import CoreData
import Foundation

protocol PersistenceManagerProtocol {
    /// This method saves the NSManagedObjectContext.
    func saveContext()
    /// This method removes the provided data from local storage.
    func removeData<Object: NSManagedObject>(object: Object)
    /// This method fetches the saved objects of the type provided in NSFetchRequest.
    func fetchData<Object: NSManagedObject>(request: NSFetchRequest<Object>) -> [Object]
}

final class PersistenceManager {
    /// A singleton instance of PersistenceManager object.
    static let shared: PersistenceManager = PersistenceManager()
    /// A container that encapsulates the Core Data stack.
    let container: NSPersistentContainer
    /// An object space to manipulate and track changes to managed objects.
    var viewContext: NSManagedObjectContext {
        container.viewContext
    }

    /// An object used for managing the local storage.
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "MessAIges")

        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }

        viewContext.automaticallyMergesChangesFromParent = true
        viewContext.mergePolicy = NSMergePolicy(merge: .mergeByPropertyStoreTrumpMergePolicyType)
    }
}

// MARK: - PersistenceManager+PersistenceManagerProtocol extension
extension PersistenceManager: PersistenceManagerProtocol {
    func removeData<Object: NSManagedObject>(object: Object) {
        viewContext.delete(object)
    }

    func fetchData<Object: NSManagedObject>(request: NSFetchRequest<Object>) -> [Object] {
        var fetchedData: [Object] = []

        do {
            fetchedData = try viewContext.fetch(request)
        } catch {
            logPrint("[Store] Failed to save the data with error: \(error)")
        }

        return fetchedData
    }

    func saveContext() {
        guard viewContext.hasChanges else { return }
        do {
            try viewContext.save()
        } catch {
            logPrint("[Store] Failed to save the context with error: \(error)")
        }
    }
}
