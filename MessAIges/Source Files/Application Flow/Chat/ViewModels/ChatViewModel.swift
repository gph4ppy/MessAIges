//
//  ChatViewModel.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 03/04/2023.
//

import Foundation
import OpenAISwift

@MainActor
final class ChatViewModel: ObservableObject {
    @Published var query: String = ""
    @Published var messages: [Message] = []
    private var client: OpenAISwift?

    func setup() {
        guard let token = Bundle.main.infoDictionary?["GPT_API_KEY"] as? String else { return }
        client = OpenAISwift(authToken: token)
    }

    func send() {
        guard !query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        let userMessage = Message(author: .user, text: query, date: Date())
        messages.append(userMessage)
        client?.sendCompletion(with: query, maxTokens: 1024) { [weak self] result in
            switch result {
            case .success(let model):
                guard let self, let answer = model.choices.first else { return }
                let chatMessage = Message(author: .chat, text: answer.text, date: Date())
                self.messages.append(chatMessage)
            case .failure(let failure):
                break // TODO: Error Handling
            }
        }
    }
}
