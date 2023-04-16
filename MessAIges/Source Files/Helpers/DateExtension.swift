//
//  DateExtension.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 16/04/2023.
//

import Foundation

extension Date {
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: self)
    }
}
