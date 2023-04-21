//
//  ChatBubble.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 03/04/2023.
//

import SwiftUI

struct ChatBubble: View {
    /// A property containing the message displayed in the bubble.
    let message: String
    /// A property containing the author of the message.
    let author: Authors

    var body: some View {
        VStack(spacing: 6) {
            Text(author.data.name)
                .font(.footnote)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: author.bubbleStyling.alignment)
                .padding(.horizontal, 16)

            Text(message)
                .padding(16)
                .background(author.bubbleStyling.color)
                .foregroundColor(.white)
                .clipShape(ChatBubbleShape(direction: direction))
                .frame(maxWidth: .infinity, alignment: author.bubbleStyling.alignment)
        }
        .padding(author.bubbleStyling.paddingEdge, 32)
    }

    /// A property containing direction of the chat bubble.
    private var direction: ChatBubbleShape.Direction {
        switch author {
        case .chat, .unknown:
            return .left
        case .user:
            return .right
        }
    }
}
