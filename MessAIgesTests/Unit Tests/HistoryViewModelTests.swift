//
//  HistoryViewModelTests.swift
//  MessAIgesTests
//
//  Created by Jakub Dąbrowski on 25/04/2023.
//

import XCTest
@testable import MessAIges

final class HistoryViewModelTests: XCTestCase {
    var sut: HistoryViewModel!
    var historyManager: HistoryManagerMock!

    @MainActor override func setUpWithError() throws {
        try super.setUpWithError()
        let apiService = APIServiceMock()
        historyManager = HistoryManagerMock()
        sut = HistoryViewModel(historyManager: historyManager)
    }

    override func tearDownWithError() throws {
        historyManager = nil
        sut = nil
        try super.tearDownWithError()
    }

    @MainActor func test_fetchData_noSavedData() {
        sut.fetchHistory()
        XCTAssertTrue(sut.chats.isEmpty)
    }

    @MainActor func test_fetchData_hasSavedData() {
        historyManager.shouldFetchMockedData = true
        sut.fetchHistory()
        XCTAssertFalse(sut.chats.isEmpty)
    }

    @MainActor func test_removeHistory() {
        let chatToRemove = MockHelper.mockHistory()
        sut.chats.append(chatToRemove)
        sut.removeHistory(chatToRemove)
        XCTAssertFalse(sut.chats.contains { $0.historyID == chatToRemove.historyID })
    }
}
