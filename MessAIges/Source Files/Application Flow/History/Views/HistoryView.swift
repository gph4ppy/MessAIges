//
//  HistoryView.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 03/04/2023.
//

import SwiftUI
import SwipeActions

struct HistoryView: View {
    @ObservedObject var viewModel: HistoryViewModel

    var body: some View {
        Group {
            if viewModel.chats.isEmpty {
                NoDataLabel(text: "No chats found - please, tap on the plus icon in the upper right corner")
            } else {
                ScrollView {
                    ForEach(viewModel.chats, id: \.historyID, content: createHistoryRow)
                }
            }
        }
        .onAppear(perform: viewModel.fetchHistory)
        .navigationTitle("MessAIges")
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

    /// This method creates a row presenting a saved history.
    /// - Parameter chat: A history object containing conversation data.
    /// - Returns: A row used in the list of saved histories.
    private func createHistoryRow(of chat: History) -> some View {
        NavigationLink {
            let viewModel = ChatViewModel(chatTitle: chat.historyTitle, messages: chat.historyMessages)
            ChatView(viewModel: viewModel)
        } label: {
            SwipeView {
                VStack(alignment: .leading, spacing: 8) {
                    Text(chat.historyTitle).bold()
                    Text(chat.historyDate.toString())
                    Divider()
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 4)
                .foregroundColor(.primary)
                .contentShape(Rectangle())
            } trailingActions: { _ in
                SwipeAction {
                    viewModel.removeHistory(chat)
                } label: { _ in
                    Image(systemName: "trash")
                        .foregroundColor(.white)
                } background: { _ in
                    Color.red
                }
                .allowSwipeToTrigger()
            }
        }
    }
}
