//
//  ChatViewModel.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 03/04/2023.
//

import Foundation
import ChatGPTSwift
import Combine

@MainActor
final class ChatViewModel: ObservableObject {
    @Published var query: String
    @Published var chatTitle: String?
    @Published var messages: [Message]
    var cancellables: AnyCancellable?

    private var apiService: APIServiceProtocol
    private var historyManager: HistoryManagerProtocol

    init(
        query: String = "",
        chatTitle: String? = nil,
        messages: [Message] = [],
        apiService: APIServiceProtocol = ApplicationServices.shared.apiService,
        historyManager: HistoryManagerProtocol = ApplicationServices.shared.historyManager
    ) {
        self.query = query
        self.chatTitle = chatTitle
        self.messages = messages
        self.apiService = apiService
        self.historyManager = historyManager
    }

    func sendMessage() {
        storeUserMessage()
        storeChatMessage()
    }

    func clearChatTitle() {
        chatTitle = nil
    }

    func saveChatToHistory() {
        guard let chatTitle else { return }
        let history = HistoryEntry(
            id: UUID(),
            title: chatTitle,
            date: Date(),
            messages: messages
        )
        historyManager.save(history: history)
        cancellables = nil
    }

    private func storeUserMessage() {
        let userMessage = MessageEntry(author: .user, text: query, date: Date())
        messages.append(userMessage)
    }

    private func storeChatMessage() {
        Task(priority: .userInitiated) {
            await apiService.sendMessage(text: query) { [weak self] response in
                guard let self else { return }
                let chatMessage = MessageEntry(author: .chat, text: response, date: Date())
                self.messages.append(chatMessage)
                self.clearQuery()
            }
        }
    }

    private func clearQuery() {
        query = ""
    }
}
