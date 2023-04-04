//
//  Message.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 03/04/2023.
//

import Foundation

struct Message: Identifiable {
    let author: Authors
    let text: String
    let date: Date
    let id: UUID = UUID()
}
