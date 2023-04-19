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
                    ForEach(viewModel.messages, id: \.messageID) { message in
                        ChatBubble(message: message.messageText, author: message.messageAuthor)
                    }
                }
            }

            TextField("Type your message here...", text: $viewModel.query)
                .textFieldStyle(.roundedBorder)
                .onSubmit { viewModel.sendMessage() }
                .submitLabel(.send)
        }
        .padding(16)
        .navigationTitle(viewModel.chatTitle ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear(perform: viewModel.clearChatTitle)
        .toolbar {
            Button(action: showTitleTextFieldAlert) {
                Image(systemName: "square.and.arrow.down")
            }
        }
    }

    private func showTitleTextFieldAlert() {
        let alert = AlertFactory.createAlertController(
            title: "Please, provide a title summarizing your conversation",
            message: "e.g. a topic of your first message",
            configuration: setupTextFieldAlert
        )
        AlertFactory.presentAlertController(alert)
    }

    private func setupTextFieldAlert(in alertController: UIAlertController) {
        setupAlertTextField(in: alertController)
        setupAlertAction(in: alertController)
    }

    private func setupAlertAction(in alertController: UIAlertController) {
        let action = UIAlertAction(
            title: "Done",
            style: .default
        ) { _ in
            viewModel.saveChatToHistory()
        }
        alertController.addAction(action)
    }

    private func setupAlertTextField(in alertController: UIAlertController) {
        alertController.addTextField { textField in
            viewModel.cancellables = NotificationCenter.default
                .publisher(for: UITextField.textDidChangeNotification, object: textField)
                .map { ($0.object as? UITextField)?.text }
                .assign(to: \.viewModel.chatTitle, on: self)
        }
    }
}
