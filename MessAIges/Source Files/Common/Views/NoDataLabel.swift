//
//  NoDataLabel.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 16/04/2023.
//

import SwiftUI

struct NoDataLabel: View {
    let text: String

    var body: some View {
        Text(text)
            .foregroundColor(.gray)
            .multilineTextAlignment(.center)
            .padding()
            .frame(maxHeight: .infinity)
    }
}
