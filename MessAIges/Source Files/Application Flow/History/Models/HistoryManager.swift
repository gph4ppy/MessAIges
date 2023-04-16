//
//  HistoryManager.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 16/04/2023.
//

import Foundation

final class HistoryManager: HistoryManagerProtocol {
    func fetch() -> [HistoryEntity] {
        let request = HistoryEntity.fetchRequest()
        return PersistenceManager.shared.fetchData(request: request)
    }

    func save(history: History) {
        let context = PersistenceManager.shared.viewContext
        let object = HistoryEntity(context: context)
        object.id = history.historyID
        object.title = history.historyTitle
        object.date = history.historyDate
        object.messages = NSOrderedSet(array: history.historyMessages)
        PersistenceManager.shared.saveContext()
    }

    func remove(history: HistoryEntity) {
        PersistenceManager.shared.removeData(object: history)
        PersistenceManager.shared.saveContext()
    }
}
