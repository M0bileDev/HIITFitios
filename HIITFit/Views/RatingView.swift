//
//  RatingView.swift
//  HIITFit
//
//  Created by Damian Ogórek on 15/02/2026.
//

import SwiftUI

struct RatingView: View {

    let exerciseIndex: Int
    @AppStorage("ratings") private var ratings = "0000"
    @State private var rating = 0

    let maximumRating = 5
    let onColor = Color.red
    let offColor = Color.gray

    var body: some View {
        HStack {
            ForEach(
                1..<maximumRating + 1,
                id: \.self,
                content: { index in
                    Image(systemName: "waveform.path.ecg").foregroundColor(
                        index > rating ? offColor : onColor
                    ).onAppear(perform: {
                        let index = ratings.index(
                            ratings.startIndex,
                            offsetBy: exerciseIndex
                        )
                        let character = ratings[index]
                        rating = character.wholeNumberValue ?? 0

                    })
                    .onTapGesture {
                        rating = index
                    }
                }
            ).font(.largeTitle)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    RatingView(exerciseIndex: 0)
}
