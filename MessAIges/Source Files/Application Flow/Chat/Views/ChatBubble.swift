//
//  ChatBubble.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 03/04/2023.
//

import SwiftUI

struct ChatBubble: View {
    enum Content {
        case message(String)
        case image(URL?)
    }

    let content: Content
    let author: Authors

    var body: some View {
        VStack(spacing: 6) {
            Text(author.data.name)
                .font(.footnote)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: author.bubbleStyling.alignment)
                .padding(.horizontal, 16)

            switch content {
            case .message(let content):
                Text(content)
                    .padding(16)
                    .background(author.bubbleStyling.color)
                    .foregroundColor(.white)
                    .clipShape(ChatBubbleShape(direction: direction))
                    .frame(maxWidth: .infinity, alignment: author.bubbleStyling.alignment)
            case .image(let url):
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }

            }
        }
        .padding(author.bubbleStyling.paddingEdge, 32)
    }

    // TODO: - Think where I can move it
    private var direction: ChatBubbleShape.Direction {
        switch author {
        case .chat:
            return .left
        case .user:
            return .right
        }
    }
}

struct UserChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble(content: .message("Test"), author: .chat)
    }
}
