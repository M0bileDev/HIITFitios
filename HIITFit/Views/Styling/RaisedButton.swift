//
//  RaisedButton.swift
//  HIITFit
//
//  Created by Damian Ogórek on 05/03/2026.
//

import SwiftUI

struct RaisedButton: View {
    var body: some View {
        Button(
            action: {},
            label: { Text("Get started").raisedButtonTextStyle() }
        )
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ZStack {
        RaisedButton().padding(20)
    }.background(Color.background)
        .buttonStyle(.raised)
}

extension Text {
    func raisedButtonTextStyle() -> some View {
        self
            .font(.body)
            .fontWeight(.bold)
    }
}

struct RaisedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding([.top, .bottom], 12)
            .background(
                Capsule()
                    .foregroundStyle(Color.background)
                    .shadow(color: Color.dropShadow, radius: 4, x: 6, y: 6)
                    .shadow(color: Color.dropHighlight, radius: 4, x: -6, y: -6)
            )
    }
}

extension ButtonStyle where Self == RaisedButtonStyle {
    static var raised: RaisedButtonStyle {
        .init()
    }
}
