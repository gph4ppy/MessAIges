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

    // MARK: - Properties

    /// A property storing a text typed in the TextField.
    @Published var query: String
    /// A title of the saved chat.
    @Published var chatTitle: String?
    /// An array of messages written in the chat.
    @Published var messages: [Message]
    /// A cancellable object that executes a provided closure when cancelled.
    var cancellables: AnyCancellable?

    // MARK: - Services

    /// An API service used for performing GPT actions.
    private var apiService: APIServiceProtocol
    /// A history manager used for managing the local storage.
    private var historyManager: HistoryManagerProtocol

    /// A ViewModel used across the views related to Chat.
    /// - Parameters:
    ///   - query: A property storing a text typed in the TextField.
    ///   - chatTitle: A title of the saved chat.
    ///   - messages: An array of messages written in the chat.
    ///   - apiService: An API service used for performing GPT actions.
    ///   - historyManager: A history manager used for managing the local storage
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

    /// This method sends user's message and stores it.
    /// After receiving a response, it is also added to the `messages` array.
    func sendMessage() {
        storeUserMessage()
        storeChatMessage()
        clearQuery()
    }

    /// This method clears the chat title, so it is not cached.
    func clearChatTitle() {
        chatTitle = nil
    }

    /// This method saves the chat to the local storage, so it is accessible from the history screen.
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

    /// This method stores the user message in the `messages` array.
    private func storeUserMessage() {
        let userMessage = MessageEntry(author: .user, text: query, date: Date())
        messages.append(userMessage)
    }

    /// This method sends a text typed in the TextField in request
    /// and receives the response message, which is stored in the `messages` array.
    private func storeChatMessage() {
        var requestText = query
        Task(priority: .userInitiated) {
            await apiService.sendMessage(text: requestText) { [weak self] response in
                guard let self else { return }
                let chatMessage = MessageEntry(author: .chat, text: response, date: Date())
                self.messages.append(chatMessage)
            }
        }
    }

    /// This method clears a text typed in the TextField.
    private func clearQuery() {
        query = ""
    }
}
