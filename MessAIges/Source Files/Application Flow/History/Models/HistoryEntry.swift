//
//  HistoryEntry.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 03/04/2023.
//

import Foundation

protocol History {
    var historyID: UUID { get }
    var historyDate: Date { get }
    var historyMessages: [Message] { get }
}

struct HistoryEntry {
    let id: UUID
    let date: Date
    let messages: [Message]
}

extension HistoryEntry: History {
    var historyID: UUID {
        id
    }

    var historyDate: Date {
        date
    }

    var historyMessages: [Message] {
        messages
    }
}
