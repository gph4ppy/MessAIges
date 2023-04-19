//
//  Authors.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 03/04/2023.
//

import Foundation

enum Authors {
    case chat
    case user
    case unknown

    init(from name: String) {
        switch name {
        case Authors.chat.data.name:
            self = .chat
        case Authors.user.data.name:
            self = .user
        default:
            self = .unknown
        }
    }

    var data: Author {
        switch self {
        case .chat:
            return Author(name: "AI")
        case .user:
            return Author(name: "You")
        case .unknown:
            return Author(name: "Unknown")
        }
    }

    var bubbleStyling: BubbleStyling {
        switch self {
        case .chat:
            return BubbleStyling(color: .blue, paddingEdge: .trailing, alignment: .leading)
        case .user:
            return BubbleStyling(color: .gray, paddingEdge: .leading, alignment: .trailing)
        case .unknown:
            return BubbleStyling(color: .black, paddingEdge: .trailing, alignment: .leading)
        }
    }
}
