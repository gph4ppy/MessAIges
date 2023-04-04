//
//  ChatView.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 03/04/2023.
//

import SwiftUI

struct ChatView: View {
    @StateObject var viewModel: ChatViewModel

    var body: some View {
        VStack {
            if viewModel.messages.isEmpty {
                Text("Welcome in a new chat! Please, type a message in a TextField below.")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(maxHeight: .infinity)
            } else {
                ScrollView {
                    ForEach(viewModel.messages) { message in
                        ChatBubble(content: .message(message.text), author: message.author)
                    }
                }
            }

            TextField("Type your message here...", text: $viewModel.query)
                .textFieldStyle(.roundedBorder)
                .onSubmit { viewModel.sendMessage() }
                .submitLabel(.send)
        }
        .padding(16)
    }
}
