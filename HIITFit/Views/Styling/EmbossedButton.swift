//
//  EmbossedButton.swift
//  HIITFit
//
//  Created by Damian Ogórek on 06/03/2026.
//

import SwiftUI

struct EmbossedButtonStyle: ButtonStyle {
    var buttonShape = EmbossedButtonShape.capsule

    func makeBody(configuration: Configuration) -> some View {
        let shadow = Color.dropShadow
        let highlight = Color.dropHighlight

        return configuration.label
            .padding(10)
            .background(
                backgroundShape(shadow: shadow, highlight: highlight)
            )

    }

    @ViewBuilder
    private func backgroundShape(shadow: Color, highlight: Color) -> some View {
        shape()
            .foregroundStyle(Color.background)
            .shadow(color: shadow, radius: 1, x: 2, y: 2)
            .shadow(color: highlight, radius: 1, x: -2, y: -2)
            .offset(x: -1, y: -1)
    }

    @ViewBuilder
    func shape() -> some View {
        switch buttonShape {
        case .circle:
            Circle()
                .stroke(Color.background, lineWidth: 2)
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
