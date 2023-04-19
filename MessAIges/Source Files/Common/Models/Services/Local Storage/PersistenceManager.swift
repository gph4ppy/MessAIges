//
//  PersistenceManager.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 06/04/2023.
//

import CoreData
import Foundation

protocol PersistenceManagerProtocol {
    func saveContext()
    func removeData<Object: NSManagedObject>(object: Object)
    func fetchData<Object: NSManagedObject>(request: NSFetchRequest<Object>) -> [Object]
}

final class PersistenceManager {
    static let shared: PersistenceManager = PersistenceManager()
    let container: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        container.viewContext
    }

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
