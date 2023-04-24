//
//  HistoryViewTests.swift
//  MessAIgesTests
//
//  Created by Jakub Dąbrowski on 24/04/2023.
//

import XCTest
@testable import MessAIges

final class HistoryViewTests: XCTestCase {
    var sut: HistoryView!
    var viewModel: HistoryViewModel!

    @MainActor override func setUpWithError() throws {
        try super.setUpWithError()
        let manager = HistoryManagerMock()
        viewModel = HistoryViewModel(historyManager: manager)
        sut = HistoryView(viewModel: viewModel)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        sut = nil
        try super.tearDownWithError()
    }

    func test_empty_view_light_mode() {
        sut.performSnapshotTests(named: "HistoryView-Empty-LightMode")
    }

    func test_empty_view_dark_mode() {
        sut.performSnapshotTests(named: "HistoryView-Empty-DarkMode", darkMode: true)
    }

    // TODO: - Fix below snapshots (still empty list)

    @MainActor func test_saved_list_light_mode() {
        viewModel.chats = mockChats()
        sut.performSnapshotTests(named: "HistoryView-Saved-LightMode")
    }

    @MainActor func test_saved_list_dark_mode() {
        viewModel.chats = mockChats()
        sut.performSnapshotTests(named: "HistoryView-Saved-DarkMode", darkMode: true)
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
