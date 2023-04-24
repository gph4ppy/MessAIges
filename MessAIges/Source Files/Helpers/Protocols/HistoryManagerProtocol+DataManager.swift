//
//  HistoryManagerProtocol+DataManager.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 16/04/2023.
//

import Foundation

protocol HistoryManagerProtocol: DataManager {
    /// This method fetches all the saved chat histories from local storage.
    func fetch() -> [History]
    /// This method saves the provided HistoryEntity to the local storage.
    /// - Parameter history: An object containing all the history data.
    func save(history: History)
    /// This method removes the provided HistoryEntity from the local storage.
    /// - Parameter history: An object containing all the history data.
    func remove(history: HistoryEntity)
}

extension HistoryManagerProtocol {
    func fetch<Object>() -> [Object] {
        fetch()
    }

    func save<Object>(object: Object) {
        guard let object = object as? History else { return }
        save(history: object)
    }

    func remove<Object>(object: Object) {
        guard let object = object as? HistoryEntity else { return }
        remove(history: object)
    }
}
