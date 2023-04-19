//
//  ChatBubble.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 03/04/2023.
//

import SwiftUI

struct ChatBubble: View {
    let message: String
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

    // TODO: - Think where I can move it
    private var direction: ChatBubbleShape.Direction {
        switch author {
        case .chat, .unknown:
            return .left
        case .user:
            return .right
        }
    }
}

struct UserChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble(message: "Test", author: .chat)
    }
}
