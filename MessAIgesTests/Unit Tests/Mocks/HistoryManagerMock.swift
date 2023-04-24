//
//  HistoryManagerMock.swift
//  MessAIgesTests
//
//  Created by Jakub Dąbrowski on 24/04/2023.
//

@testable import MessAIges

final class HistoryManagerMock: HistoryManager {
    var didSave: Bool = false
    var didRemove: Bool = false

    override func fetch() -> [History] {
        return []
    }

    override func save(history: History) {
        didSave = true
    }

    override func remove(history: HistoryEntity) {
        didRemove = true
    }
}
