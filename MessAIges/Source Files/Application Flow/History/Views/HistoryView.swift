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
                    ForEach(viewModel.chats, id: \.historyID) { chat in
                        VStack {
                            Text(chat.historyID.uuidString).bold()
                            Text(chat.historyDate.toString())
                        }
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
}
