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

    var data: Author {
        switch self {
        case .chat:
            return Author(name: "AI", avatar: nil)
        case .user:
            return Author(name: "User", avatar: nil)
        }
    }
}
