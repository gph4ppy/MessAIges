//
//  Authors.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 03/04/2023.
//

import Foundation

/// A model used for determining who is the author of the message.
enum Authors {
    case chat
    case user
    case unknown

    /// A model used for determining who is the author of the message, created from the provided name.
    /// - Parameter name: Name of the author typed as string.
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

    /// A property containing all the data about the message author.
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

    /// A property containing all the styling data.
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
