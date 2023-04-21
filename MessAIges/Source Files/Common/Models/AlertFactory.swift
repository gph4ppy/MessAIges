//
//  AlertFactory.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 18/04/2023.
//

import UIKit

/// A factory used for creating components and performing actions related to the alerts.
enum AlertFactory {
    /// This method creates an alert controller, which can be customized.
    /// - Parameters:
    ///   - title: A title of the alert.
    ///   - message: A text that provides more details about the reason for the alert.
    ///   - configuration: A closure used for alert controller configuration.
    /// - Returns: An object that displays an alert message.
    static func createAlertController(
        title: String?,
        message: String?,
        configuration: (UIAlertController) -> Void
    ) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        configuration(alert)
        return alert
    }

    /// This method presents the provided alert controller.
    /// - Parameter alertController: An alert controller meant to be presented on the screen.
    static func presentAlertController(_ alertController: UIAlertController) {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        window?.rootViewController?.present(alertController, animated: true)
    }
}
