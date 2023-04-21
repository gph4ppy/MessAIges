//
//  MessageEntry.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 03/04/2023.
//

import Foundation

protocol Message {
    /// A property storing message author.
    var messageAuthor: Authors { get }
    /// A property storing message text.
    var messageText: String { get }
    /// A property storing date when message has been sent.
    var messageDate: Date { get }
    /// A property storing message identifier.
    var messageID: UUID { get }
}

/// An object containing all the message data.
struct MessageEntry {
    let author: Authors
    let text: String
    let date: Date
    let id: UUID = UUID()
}

// MARK: - MessageEntry+Message extension
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
