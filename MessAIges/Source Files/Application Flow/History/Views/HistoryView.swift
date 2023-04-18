//
//  HistoryView.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 03/04/2023.
//

import SwiftUI

struct HistoryView: View {
    @StateObject var viewModel: HistoryViewModel = HistoryViewModel()

    var body: some View {
        Group {
            if viewModel.chats.isEmpty {
                NoDataLabel(text: "No chats found - please, tap on the plus icon in the upper right corner")
            } else {
                List {
                    ForEach(viewModel.chats, id: \.historyID, content: createHistoryRow).onDelete {
                        viewModel.removeHistory(at: $0)
                    }
                }
            }
        }
        .onAppear(perform: viewModel.fetchHistory)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    ChatView(viewModel: ChatViewModel())
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }

    private func createHistoryRow(of chat: History) -> some View {
        NavigationLink {
            let viewModel = ChatViewModel(chatTitle: chat.historyTitle, messages: chat.historyMessages)
            ChatView(viewModel: viewModel)
        } label: {
            VStack(alignment: .leading, spacing: 8) {
                Text(chat.historyTitle).bold()
                Text(chat.historyDate.toString())
            }
        }
    }
}
