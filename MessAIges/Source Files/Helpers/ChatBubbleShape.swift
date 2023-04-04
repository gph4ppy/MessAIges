//
//  ChatBubbleShape.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 04/04/2023.
//

import SwiftUI

struct ChatBubbleShape: Shape {
    enum Direction {
        case left
        case right
    }

    let direction: Direction

    func path(in rect: CGRect) -> Path {
        createPath(in: rect)
    }

    private func createPath(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let path = Path { path in
            path.move(to: CGPoint(x: 24, y: height))
            switch direction {
            case .left:
                createLeftBubble(in: &path, width: width, height: height)
            case .right:
                createRightBubble(in: &path, width: width, height: height)
            }
        }
        return path
    }

    private func createLeftBubble(in path: inout Path, width: CGFloat, height: CGFloat) {
        path.addLine(to: CGPoint(x: width - 24, y: height))
        path.addCurve(
            to: CGPoint(x: width - 4, y: height - 20),
            control1: CGPoint(x: width - 12, y: height),
            control2: CGPoint(x: width - 4, y: height - 8)
        )
        path.addLine(to: CGPoint(x: width - 4, y: 20))
        path.addCurve(
            to: CGPoint(x: width - 24, y: 0),
            control1: CGPoint(x: width - 4, y: 8),
            control2: CGPoint(x: width - 12, y: 0)
        )
        path.addLine(to: CGPoint(x: 20, y: 0))
        path.addCurve(
            to: CGPoint(x: 4, y: 20),
            control1: CGPoint(x: 12, y: 0),
            control2: CGPoint(x: 4, y: 8)
        )
        path.addLine(to: CGPoint(x: 4, y: height - 10))
        path.addCurve(
            to: CGPoint(x: 0, y: height),
            control1: CGPoint(x: 4, y: height - 1),
            control2: CGPoint(x: 0, y: height)
        )
        path.addLine(to: CGPoint(x: -0.05, y: height))
        path.addCurve(
            to: CGPoint(x: 10, y: height - 4),
            control1: CGPoint(x: 4, y: height + 0.5),
            control2: CGPoint(x: 8, y: height - 1)
        )
        path.addCurve(
            to: CGPoint(x: 25, y: height),
            control1: CGPoint(x: 16, y: height),
            control2: CGPoint(x: 20, y: height)
        )
    }

    private func createRightBubble(in path: inout Path, width: CGFloat, height: CGFloat) {
        path.addLine(to: CGPoint(x: 24, y: height))
        path.addCurve(
            to: CGPoint(x: 4, y: height - 20),
            control1: CGPoint(x: 12, y: height),
            control2: CGPoint(x: 4, y: height - 8)
        )
        path.addLine(to: CGPoint(x: 4, y: 20))
        path.addCurve(
            to: CGPoint(x: 24, y: 0),
            control1: CGPoint(x: 4, y: 8),
            control2: CGPoint(x: 12, y: 0)
        )
        path.addLine(to: CGPoint(x: width - 20, y: 0))
        path.addCurve(
            to: CGPoint(x: width - 4, y: 20),
            control1: CGPoint(x: width - 12, y: 0),
            control2: CGPoint(x: width - 4, y: 8)
        )
        path.addLine(to: CGPoint(x: width - 4, y: height - 10))
        path.addCurve(
            to: CGPoint(x: width, y: height),
            control1: CGPoint(x: width - 4, y: height - 1),
            control2: CGPoint(x: width, y: height)
        )
        path.addLine(to: CGPoint(x: width + 0.05, y: height))
        path.addCurve(
            to: CGPoint(x: width - 10, y: height - 4),
            control1: CGPoint(x: width - 4, y: height + 0.5),
            control2: CGPoint(x: width - 8, y: height - 1)
        )
        path.addCurve(
            to: CGPoint(x: width - 24, y: height),
            control1: CGPoint(x: width - 16, y: height),
            control2: CGPoint(x: width - 20, y: height)
        )
    }
}
