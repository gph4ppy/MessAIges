//
//  HistoryEntry.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 03/04/2023.
//

import Foundation

struct HistoryEntry: Identifiable {
    let id: UUID = UUID()
    let messages: [Message]
}
