//
//  ChatViewModel.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 03/04/2023.
//

import Foundation
import ChatGPTSwift

@MainActor
final class ChatViewModel: ObservableObject {
    @Published var query: String
    @Published var messages: [Message]

    private var apiService: APIServiceProtocol

    init(
        query: String = "",
        messages: [Message] = [],
        apiService: APIServiceProtocol = ApplicationServices.shared.apiService
    ) {
        self.query = query
        self.messages = messages
        self.apiService = apiService
    }

    func sendMessage() {
        storeUserMessage()
        storeChatMessage()
    }

    private func storeUserMessage() {
        let userMessage = Message(author: .user, text: query, date: Date())
        messages.append(userMessage)
    }

    private func storeChatMessage() {
        Task(priority: .userInitiated) {
            await apiService.sendMessage(text: query) { [weak self] response in
                guard let self else { return }
                let chatMessage = Message(author: .chat, text: response, date: Date())
                self.messages.append(chatMessage)
                self.clearQuery()
            }
        }
    }

    private func clearQuery() {
        query = ""
    }
}
