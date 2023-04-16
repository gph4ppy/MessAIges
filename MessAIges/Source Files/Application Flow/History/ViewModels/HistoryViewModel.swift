//
//  HistoryViewModel.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 03/04/2023.
//

import Foundation

@MainActor
final class HistoryViewModel: ObservableObject {
    @Published var chats: [History]
    private(set) var historyManager: HistoryManagerProtocol

    init(
        chats: [History] = [],
        historyManager: HistoryManagerProtocol = ApplicationServices.shared.historyManager
    ) {
        self.chats = chats
        self.historyManager = historyManager
    }

    func fetchHistory() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            let data = self.historyManager.fetch()
            self.chats = data
        }
    }

    func removeHistory(at offsets: IndexSet) {
        removeFromLocalStorage(at: offsets)
        removeFromList(at: offsets)
    }

    private func removeFromLocalStorage(at offsets: IndexSet) {
        offsets.forEach { [weak self] index in
            guard let self else { return }
            let removedEntry = self.chats[index]
            self.historyManager.remove(object: removedEntry)
        }
    }

    private func removeFromList(at offsets: IndexSet) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.chats.remove(atOffsets: offsets)
        }
    }
}
