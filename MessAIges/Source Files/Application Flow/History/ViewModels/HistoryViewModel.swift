//
//  HistoryViewModel.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 03/04/2023.
//

import Foundation

@MainActor
final class HistoryViewModel: ObservableObject {
    var chats: [HistoryEntry]
    private var apiService: APIServiceProtocol

    init(
        chats: [HistoryEntry] = [],
        apiService: APIServiceProtocol = ApplicationServices.shared.apiService
    ) {
        self.chats = chats
        self.apiService = apiService
    }

    func fetchHistory() {

    }
}
