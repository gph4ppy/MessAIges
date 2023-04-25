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
    var historyManager: HistoryManagerMock!
    var viewModel: HistoryViewModel!

    @MainActor override func setUpWithError() throws {
        try super.setUpWithError()
        historyManager = HistoryManagerMock()
        viewModel = HistoryViewModel(historyManager: historyManager)
        sut = HistoryView(viewModel: viewModel)
    }

    override func tearDownWithError() throws {
        historyManager = nil
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

    @MainActor func test_saved_list_light_mode() {
        historyManager.shouldFetchMockedData = true
        sut.performSnapshotTests(named: "HistoryView-Saved-LightMode")
    }

    @MainActor func test_saved_list_dark_mode() {
        historyManager.shouldFetchMockedData = true
        sut.performSnapshotTests(named: "HistoryView-Saved-DarkMode", darkMode: true)
    }
}
