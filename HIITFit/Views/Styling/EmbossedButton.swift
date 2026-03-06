//
//  EmbossedButton.swift
//  HIITFit
//
//  Created by Damian Ogórek on 06/03/2026.
//

import SwiftUI

struct EmbossedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let shadow = Color.dropShadow
        let highlight = Color.dropHighlight
        return configuration.label
            .padding(10)
            .background(
                Capsule()
                    .stroke(Color.background, lineWidth: 2)
                    .foregroundStyle(Color.background)
                    .shadow(color: shadow, radius: 1, x: 2, y: 2)
                    .shadow(color: highlight, radius: 1, x: -2, y: -2)
                    .offset(x: -1, y: -1)
            )

    }
}

#Preview(traits: .sizeThatFitsLayout) {
    Button("History") {
        print("Hello World")
    }.fontWeight(.bold)
        .buttonStyle(EmbossedButtonStyle())
        .padding(40)
}
