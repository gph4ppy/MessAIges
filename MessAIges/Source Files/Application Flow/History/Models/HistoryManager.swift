//
//  HistoryManager.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 16/04/2023.
//

import Foundation

/// An object responsible for performing the actions related to the history.
final class HistoryManager: HistoryManagerProtocol {
    /// This method fetches the history entities from the local storage.
    /// - Returns: An array of all saved histories.
    func fetch() -> [HistoryEntity] {
        let request = HistoryEntity.fetchRequest()
        return PersistenceManager.shared.fetchData(request: request)
    }

    /// This method saves the history to the local storage.
    /// - Parameter history: A history object containing conversation data.
    func save(history: History) {
        let context = PersistenceManager.shared.viewContext
        let historyEntity = HistoryEntity(context: context)
        historyEntity.id = history.historyID
        historyEntity.title = history.historyTitle
        historyEntity.date = history.historyDate

        var messages: [MessagesEntity] = []
        for message in history.historyMessages {
            let messageEntity = MessagesEntity(context: context)
            messageEntity.date = message.messageDate
            messageEntity.history = historyEntity
            messageEntity.text = message.messageText
            messageEntity.author = message.messageAuthor.data.name
            messageEntity.id = message.messageID
            messages.append(messageEntity)
        }

        historyEntity.messages = NSOrderedSet(array: messages)
        PersistenceManager.shared.saveContext()
    }

    /// This method removes the history entity from the local storage.
    /// - Parameter history: A history object containing conversation data.
    func remove(history: HistoryEntity) {
        PersistenceManager.shared.removeData(object: history)
        PersistenceManager.shared.saveContext()
    }
}
