//
//  ContainerView.swift
//  HIITFit
//
//  Created by Damian Ogórek on 07/03/2026.
//

import SwiftUI

struct ContainerView<Content: View>: View {
    var content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundColor(Color.background)
            VStack {
                Spacer()
                Rectangle()
                    .frame(height: 25)
                    .foregroundColor(Color.background)
            }
            content
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ContainerView(content: {
        VStack {
            RaisedButton(buttonText: "Hello World") {}
                .padding(50)
            Button("Tap me!") {}
                .buttonStyle(EmbossedButtonStyle(buttonShape: .circle))
        }
    }).padding(50)
}
