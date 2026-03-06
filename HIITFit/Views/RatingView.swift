//
//  RatingView.swift
//  HIITFit
//
//  Created by Damian Ogórek on 15/02/2026.
//

import SwiftUI

struct RatingView: View {

    let exerciseIndex: Int
    @AppStorage("ratings") private var ratings = ""
    @State private var rating = 0

    init(exerciseIndex: Int) {
        self.exerciseIndex = exerciseIndex

        let desiredLength = Exercise.exercises.count
        if ratings.count < desiredLength {
            ratings = ratings.padding(
                toLength: desiredLength,
                withPad: "0",
                startingAt: 0
            )
        }
    }

    let maximumRating = 5
    let onColor = Color.red
    let offColor = Color.gray

    fileprivate func convertRating() {
        let index = ratings.index(
            ratings.startIndex,
            offsetBy: exerciseIndex
        )
        let character = ratings[index]
        rating = character.wholeNumberValue ?? 0
    }

    var body: some View {
        HStack {
            ForEach(
                1..<maximumRating + 1,
                id: \.self,
                content: { index in
                    Button(
                        action: {
                            updateRating(index: index)
                        },
                        label: {
                            Image(systemName: "waveform.path.ecg")
                                .foregroundStyle(
                                    index > rating ? offColor : onColor
                                )
                                .font(.body)
                        }
                    )
                    .buttonStyle(EmbossedButtonStyle(buttonShape: .circle))
                    .onChange(
                        of: ratings,
                        {
                            convertRating()
                        }
                    )
                    .onAppear {
                        convertRating()
                    }
                }
            ).font(.largeTitle)
        }
    }

    func updateRating(index: Int) {
        rating = index
        let index = ratings.index(ratings.startIndex, offsetBy: exerciseIndex)
        ratings.replaceSubrange(index...index, with: String(rating))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    RatingView(exerciseIndex: 0)
}
