//
//  ChatView.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 03/04/2023.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var viewModel: ChatViewModel

    var body: some View {
        VStack {
            if viewModel.messages.isEmpty {
                NoDataLabel(text: "Welcome in a new chat! Please, type a message in a TextField below.")
            } else {
                ScrollView {
                    ForEach(viewModel.messages) { message in
                        ChatBubble(message: message.text, author: message.author)
                    }
                }
            }

            TextField("Type your message here...", text: $viewModel.query)
                .textFieldStyle(.roundedBorder)
                .onSubmit { viewModel.sendMessage() }
                .submitLabel(.send)
        }
        .padding(16)
        .toolbar {
            Button {
                let history = HistoryEntry(
                    id: UUID(),
                    title: "AAAAA\(UUID())",
                    date: Date(),
                    messages: viewModel.messages
                )
                HistoryManager().save(history: history)
            } label: {
                Image(systemName: "square.and.arrow.down")
            }
        }
    }
}
