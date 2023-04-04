//
//  MessAIgesApp.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 03/04/2023.
//

import SwiftUI

@main
struct MessAIgesApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
//                HistoryView()
                ChatView(viewModel: .init())
            }
        }
    }
}
