//
//  WelcomeImages.swift
//  HIITFit
//
//  Created by Damian Ogórek on 07/03/2026.
//

import SwiftUI

extension WelcomeView {
    static var bubbles: some View {
        ZStack {
            Image(.arm)
                .resizedToFill(width: 100, height: 100)
                .clipShape(Circle())
                .offset(x: -100, y: 30)
            Image(.exercise)
                .resizedToFill(width: 70, height: 70)
                .clipShape(Circle())
                .offset(x: -80, y: -80)
            Image(.hands)
                .resizedToFill(width: 120, height: 120)
                .clipShape(Circle())
                .offset(x: 85, y: 35)
            Image(.head)
                .resizedToFill(width: 60, height: 60)
                .clipShape(Circle())
                .offset(x: -15, y: -25, )
        }.frame(maxWidth: .infinity, maxHeight: 220)
            .shadow(color: .dropShadow, radius: 6)
            .padding(.top, 10)
            .padding(.bottom, 10)
    }
}

#Preview(
    traits: .sizeThatFitsLayout,
    body: {
        WelcomeView.bubbles
    }
)
