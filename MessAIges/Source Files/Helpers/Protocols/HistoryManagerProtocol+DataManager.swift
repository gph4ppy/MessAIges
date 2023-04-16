//
//  HistoryManagerProtocol+DataManager.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 16/04/2023.
//

import Foundation

protocol HistoryManagerProtocol: DataManager {
    func fetch() -> [HistoryEntity]
    func save(history: History)
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
