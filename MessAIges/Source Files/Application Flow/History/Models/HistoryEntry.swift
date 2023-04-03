//
//  HistoryEntry.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 03/04/2023.
//

import Foundation

struct HistoryEntry {
    let id: UUID
    let date: Date
    let messages: [Message]
}
