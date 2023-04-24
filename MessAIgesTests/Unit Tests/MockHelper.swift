//
//  MockHelper.swift
//  MessAIgesTests
//
//  Created by Jakub Dąbrowski on 24/04/2023.
//

import Foundation
@testable import MessAIges

enum MockHelper {
    static func mockHistory(
        id: UUID = UUID(),
        title: String = "TEST",
        date: Date = Date(),
        messages: [Message] = []
    ) -> History {
        HistoryEntry(id: UUID(), title: title, date: date, messages: messages)
    }
}
