//
//  HistoryManagerMock.swift
//  MessAIgesTests
//
//  Created by Jakub Dąbrowski on 24/04/2023.
//

import Foundation
@testable import MessAIges

final class HistoryManagerMock: HistoryManager {
    var didSave: Bool = false
    var didRemove: Bool = false
    var shouldFetchMockedData: Bool = false

    override func fetch() -> [History] {
        shouldFetchMockedData ? mockChats() : []
    }

    override func save(history: History) {
        didSave = true
    }

    override func remove(history: HistoryEntity) {
        didRemove = true
    }

    // MARK: - Helpers

    private func mockChats() -> [History] {
        [
            HistoryEntry(id: UUID(), title: "Test1", date: Date(), messages: []),
            HistoryEntry(id: UUID(), title: "Test2", date: Date(), messages: []),
            HistoryEntry(id: UUID(), title: "Test3", date: Date(), messages: []),
            HistoryEntry(id: UUID(), title: "Test4", date: Date(), messages: [])
        ]
    }
}
