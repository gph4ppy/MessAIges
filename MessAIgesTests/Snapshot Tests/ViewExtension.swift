//
//  ViewExtension.swift
//  MessAIgesTests
//
//  Created by Jakub Dąbrowski on 24/04/2023.
//

import SwiftUI
import SnapshotTesting

extension View {
    func performSnapshotTests(
        named name: String,
        precision: Float = 0.995,
        file: StaticString = #file,
        line: UInt = #line,
        darkMode: Bool = false
    ) {
        let controller = UIHostingController(rootView: self)
        if darkMode {
            controller.overrideUserInterfaceStyle = .dark
        } else {
            controller.overrideUserInterfaceStyle = .light
        }
        assertSnapshot(
            matching: controller,
            as: .image(on: .iPhoneX, precision: precision),
            named: name,
            file: file,
            testName: "MessAIges",
            line: line
        )
    }
}
