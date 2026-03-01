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
        if ratings.count < desiredLength{
            ratings = ratings.padding(toLength: desiredLength, withPad: "0", startingAt: 0)
        }
    }

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
                        updateRating(index: index)
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
