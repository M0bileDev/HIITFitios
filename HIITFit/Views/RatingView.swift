//
//  RatingView.swift
//  HIITFit
//
//  Created by Damian Ogórek on 15/02/2026.
//

import SwiftUI

struct RatingView: View {
    var body: some View {
        HStack {
            ForEach(
                0..<5,
                content: { _ in
                    Image(systemName: "waveform.path.ecg").foregroundColor(
                        .gray
                    )
                    .font(.largeTitle)
                }
            )
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    RatingView()
}
