//
//  EmbossedButton.swift
//  HIITFit
//
//  Created by Damian Ogórek on 06/03/2026.
//

import SwiftUI

struct EmbossedButtonStyle: ButtonStyle {

    var buttonShape = EmbossedButtonShape.capsule
    var buttonScale = 1.0

    func makeBody(configuration: Configuration) -> some View {
        let shadow = Color.dropShadow
        let highlight = Color.dropHighlight

        return configuration.label
            .padding(10)
            .background(
                backgroundShape(shadow: shadow, highlight: highlight)
            ).scaleEffect(configuration.isPressed ? buttonScale : 1.0)

    }

    @ViewBuilder
    private func backgroundShape(shadow: Color, highlight: Color) -> some View {
        GeometryReader { geometry in
            shape(size: geometry.size)
                .foregroundStyle(Color.background)
                .shadow(color: shadow, radius: 1, x: 2, y: 2)
                .shadow(color: highlight, radius: 1, x: -2, y: -2)
                .offset(x: -1, y: -1)
        }
    }

    @ViewBuilder
    func shape(size: CGSize) -> some View {
        switch buttonShape {
        case .circle:
            Circle()
                .stroke(Color.background, lineWidth: 2)
                .frame(
                    width: max(size.width, size.height),
                    height: max(size.width, size.height)
                ).offset(x: -1)
                .offset(
                    y: -max(size.width, size.height) / 2 + min(
                        size.width,
                        size.height
                    ) / 2
                )
        case .capsule:
            Capsule()
                .stroke(Color.background, lineWidth: 2)
        }
    }
}

enum EmbossedButtonShape {
    case circle, capsule
}

#Preview(traits: .sizeThatFitsLayout) {
    Button("History") {
        print("Hello World")
    }.fontWeight(.bold)
        .buttonStyle(EmbossedButtonStyle(buttonShape: .circle))
        .padding(40)
}
