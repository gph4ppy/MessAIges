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
        Text(message)
            .padding()
            .background(author.bubbleStyling.color)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .frame(maxWidth: .infinity, alignment: author.bubbleStyling.alignment)
            .padding(author.bubbleStyling.paddingEdge, 32)
    }
}

struct UserChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble(message: "Test message 123", author: .chat)
    }
}
