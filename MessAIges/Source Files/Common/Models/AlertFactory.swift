//
//  AlertFactory.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 18/04/2023.
//

import UIKit

enum AlertFactory {
    static func createAlertController(
        title: String?,
        message: String?,
        configuration: (UIAlertController) -> Void
    ) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        configuration(alert)
        return alert
    }

    static func presentAlertController(_ alertController: UIAlertController) {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        window?.rootViewController?.present(alertController, animated: true)
    }
}
