//
//  HistoryViewModel.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 03/04/2023.
//

import Foundation

@MainActor
final class HistoryViewModel: ObservableObject {
    /// An array of saved chats used as a data source.
    @Published var chats: [History]
    /// A manager responsible for performing the actions related to the history.
    private(set) var historyManager: HistoryManagerProtocol

    /// A ViewModel used across the views related to History.
    init(
        chats: [History] = [],
        historyManager: HistoryManagerProtocol = ApplicationServices.shared.historyManager
    ) {
        self.chats = chats
        self.historyManager = historyManager
    }

    /// This method fetches the history.
    func fetchHistory() {
        let data = historyManager.fetch()
        chats = data
    }

    /// This method removes the history from data source and local storage.
    func removeHistory(_ history: History) {
        removeFromList(history)
        removeFromLocalStorage(history)
    }

    /// This method removes the history from local storage.
    private func removeFromLocalStorage(_ history: History) {
        guard let history = history as? HistoryEntity else { return }
        historyManager.remove(object: history)
    }

    /// This method removes the history from data source.
    private func removeFromList(_ history: History) {
        chats.removeAll { $0.historyID == history.historyID }
    }
}
