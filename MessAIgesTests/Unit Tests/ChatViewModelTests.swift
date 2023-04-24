//
//  ChatViewModelTests.swift
//  MessAIgesTests
//
//  Created by Jakub Dąbrowski on 24/04/2023.
//

import XCTest
@testable import MessAIges

final class ChatViewModelTests: XCTestCase {
    var sut: ChatViewModel!
    var historyManager: HistoryManagerMock!

    @MainActor override func setUpWithError() throws {
        try super.setUpWithError()
        let apiService = APIServiceMock()
        historyManager = HistoryManagerMock()
        sut = ChatViewModel(apiService: apiService, historyManager: historyManager)
    }

    @MainActor func test_sendMessage_success() {
        let messageText = "test"
        sut.query = messageText
        sut.sendMessage()
        XCTAssertTrue(sut.query.isEmpty)
        XCTAssertFalse(sut.messages.isEmpty)
        XCTAssertTrue(sut.messages.contains { $0.messageText == messageText })
    }

    @MainActor func test_sendMessage_failure() {
        let messageText = ""
        sut.query = messageText
        sut.sendMessage()
        XCTAssertTrue(sut.query.isEmpty)
        XCTAssertTrue(sut.messages.isEmpty)
    }

    @MainActor func test_clearChatTitle() {
        sut.clearChatTitle()
        XCTAssertNil(sut.chatTitle)
    }

    @MainActor func test_saveChatToHistory_success() {
        let chatTitle = "Test"
        let historyMock = MockHelper.mockHistory(title: chatTitle)
        sut.chatTitle = chatTitle
        sut.saveChatToHistory()
        XCTAssertTrue(historyManager.didSave)
    }

    @MainActor func test_saveChatToHistory_failure() {
        sut.saveChatToHistory()
        XCTAssertFalse(historyManager.didSave)
    }
}
