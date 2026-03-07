//
//  GradientBackground.swift
//  HIITFit
//
//  Created by Damian Ogórek on 08/03/2026.
//

import SwiftUI

struct GradientBackground: View {
    var gradient: Gradient {
        let color1 = Color.gradientTop
        let color2 = Color.gradientBottom
        let color3 = Color.background

        return Gradient(stops: [
            Gradient.Stop(color: color1, location: 0),
            Gradient.Stop(color: color2, location: 0.2),
            Gradient.Stop(color: color3, location: 0.2),
            Gradient.Stop(color: color3, location: 1),
        ])
    }

    var body: some View {
        LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    }
}

#Preview {
    GradientBackground()
}
