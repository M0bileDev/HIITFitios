//
//  WelcomeTitle.swift
//  HIITFit
//
//  Created by Damian Ogórek on 07/03/2026.
//

import SwiftUI

extension WelcomeView {
    static var welocomeTtile: some View {
        return VStack {
            Text("Get fit")
                .font(.largeTitle)
                .fontWeight(.black)
                .kerning(2)
        }
    }

}

#Preview(
    traits: .sizeThatFitsLayout,
    body: {
        WelcomeView.welocomeTtile
    }
)
