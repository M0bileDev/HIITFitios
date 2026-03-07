//
//  GradientBackground.swift
//  HIITFit
//
//  Created by Damian Ogórek on 08/03/2026.
//

import SwiftUI

struct GradientBackground: View {
    var gradient: Gradient {
        Gradient(colors: [
            Color.gradientTop,
            Color.gradientBottom,
        ])
    }

    var body: some View {
        LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
    }
}

#Preview {
    GradientBackground()
}
