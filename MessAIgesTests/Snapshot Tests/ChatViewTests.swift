//
//  ChatViewTests.swift
//  MessAIgesTests
//
//  Created by Jakub Dąbrowski on 25/04/2023.
//

import XCTest
@testable import MessAIges

final class ChatViewTests: XCTestCase {
    var sut: ChatView!
    var viewModel: ChatViewModel!

    @MainActor override func setUpWithError() throws {
        try super.setUpWithError()
        viewModel = ChatViewModel()
        sut = ChatView(viewModel: self.viewModel)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        sut = nil
        try super.tearDownWithError()
    }

    func test_empty_view_light_mode() {
        sut.performSnapshotTests(named: "ChatView-Empty-LightMode")
    }

    func test_empty_view_dark_mode() {
        sut.performSnapshotTests(named: "ChatView-Empty-DarkMode", darkMode: true)
    }

    @MainActor func test_empty_view_query_typed_light_mode() {
        viewModel.query = "Test Query"
        sut.performSnapshotTests(named: "ChatView-Query-LightMode")
    }

    @MainActor func test_empty_view_query_typed_dark_mode() {
        viewModel.query = "Test Query"
        sut.performSnapshotTests(named: "ChatView-Query-DarkMode", darkMode: true)
    }

    @MainActor func test_messages_light_mode() {
        viewModel.messages = mockMessages()
        sut.performSnapshotTests(named: "ChatView-Messages-LightMode")
    }

    @MainActor func test_messages_dark_mode() {
        viewModel.messages = mockMessages()
        sut.performSnapshotTests(named: "ChatView-Messages-DarkMode", darkMode: true)
    }

    @MainActor func test_messages_query_typed_light_mode() {
        viewModel.messages = mockMessages()
        viewModel.query = "Test Query"
        sut.performSnapshotTests(named: "ChatView-Messages-Query-LightMode")
    }

    @MainActor func test_messages_query_typed_dark_mode() {
        viewModel.messages = mockMessages()
        viewModel.query = "Test Query"
        sut.performSnapshotTests(named: "ChatView-Messages-Query-DarkMode", darkMode: true)
    }

    // MARK: - Helpers

    private func mockMessages() -> [Message] {
        [
            MessageEntry(author: .user, text: "User Message", date: Date()),
            MessageEntry(author: .chat, text: "Chat Message", date: Date()),
            MessageEntry(author: .unknown, text: "Unknown Message", date: Date())
        ]
    }
}
