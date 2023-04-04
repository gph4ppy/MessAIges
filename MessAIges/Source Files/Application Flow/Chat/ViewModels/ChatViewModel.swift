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
    @Published var query: String = ""
    @Published var messages: [Message] = []
    private var client: ChatGPTAPI?

    @Sendable func setup() async {
        guard let token = Bundle.main.infoDictionary?["GPT_API_KEY"] as? String else { return }
        client = ChatGPTAPI(apiKey: token)
    }

    @Sendable func send() async {
        guard !query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        let userMessage = Message(author: .user, text: query, date: Date())
        messages.append(userMessage)

        do {
            guard let response = try await client?.sendMessage(text: query) else { return }
            let chatMessage = Message(author: .chat, text: response, date: Date())
            self.messages.append(chatMessage)
            query = ""
        } catch {
            dump(error.localizedDescription)
            // TODO: Error Handling
        }
    }
}
