//
//  WelcomeSubtitle.swift
//  HIITFit
//
//  Created by Damian Ogórek on 07/03/2026.
//

import SwiftUI

extension WelcomeView {
    static var welocomeSubtitle: some View {
        return Text("by exercising \nat home")
                .font(.headline)
                .fontWeight(.medium)
                .kerning(2)
                .fixedSize(horizontal: false, vertical: true)
    }

}

#Preview(
    traits: .sizeThatFitsLayout,
    body: {
        WelcomeView.welocomeSubtitle
    }
)
