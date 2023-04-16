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
                let history = HistoryEntry(id: UUID(), date: Date(), messages: viewModel.messages)
                HistoryManager().save(history: history)
            } label: {
                Image(systemName: "square.and.arrow.down")
            }
        }
    }
}

protocol DataManager {
    func fetch<Object>() -> [Object]
    func save<Object>(object: Object)
    func remove<Object>(object: Object)
}

protocol HistoryManagerProtocol: DataManager {
    func fetch() -> [HistoryEntity]
    func save(history: History)
    func remove(history: HistoryEntity)
}

extension HistoryManagerProtocol {
    func fetch<Object>() -> [Object] {
        fetch()
    }

    func save<Object>(object: Object) {
        guard let object = object as? History else { return }
        save(history: object)
    }

    func remove<Object>(object: Object) {
        guard let object = object as? HistoryEntity else { return }
        remove(history: object)
    }
}

final class HistoryManager: HistoryManagerProtocol {
    func fetch() -> [HistoryEntity] {
        let request = HistoryEntity.fetchRequest()
        return PersistenceManager.shared.fetchData(request: request)
    }

    func save(history: History) {
        let context = PersistenceManager.shared.viewContext
        let object = HistoryEntity(context: context)
        object.id = UUID()
        object.date = Date()
        object.messages = []
        PersistenceManager.shared.saveContext()
    }

    func remove(history: HistoryEntity) {
        PersistenceManager.shared.removeData(object: history)
    }
}
