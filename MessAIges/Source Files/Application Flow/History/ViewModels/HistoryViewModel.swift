//
//  HistoryViewModel.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 03/04/2023.
//

import Foundation

@MainActor
final class HistoryViewModel: ObservableObject {
    @Published var chats: [History] = []

    func fetchHistory() {
        let request = HistoryEntity.fetchRequest()
        let data = PersistenceManager.shared.fetchData(request: request)
        DispatchQueue.main.async { [weak self] in
            self?.chats = data
        }
    }
}
