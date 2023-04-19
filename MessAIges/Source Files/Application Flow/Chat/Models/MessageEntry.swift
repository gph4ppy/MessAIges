//
//  MessageEntry.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 03/04/2023.
//

import Foundation

protocol Message {
    var messageAuthor: Authors { get }
    var messageText: String { get }
    var messageDate: Date { get }
    var messageID: UUID { get }
}

struct MessageEntry {
    let author: Authors
    let text: String
    let date: Date
    let id: UUID = UUID()
}

extension MessageEntry: Message {
    var messageAuthor: Authors {
        author
    }

    var messageText: String {
        text
    }

    var messageDate: Date {
        date
    }

    var messageID: UUID {
        id
    }
}
