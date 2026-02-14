//
//  ExerciseView.swift
//  HIITFit
//
//  Created by Damian Ogórek on 12/02/2026.
//

import AVKit
import SwiftUI

struct ExerciseView: View {
    let index: Int
    var exercise: Exercise {
        Exercise.exercises[index]
    }

    var body: some View {
        // container view that provides with the screen’s measurements
        GeometryReader { geometry in
            VStack {
                HeaderView(exerciceName: exercise.exerciseName).padding(.bottom)
                if let url = Bundle.main.url(
                    forResource: exercise.videoName,
                    withExtension: "mp4"
                ) {
                    VideoPlayer(player: AVPlayer(url: url)).frame(height: geometry.size.height * 0.45)
                } else {
                    Text("Couldn't find \(exercise.videoName).mp4").foregroundColor(
                        .red
                    )
                }
                Text("Timer")
                Text("Start/Done button")
                Text("Rating")
                Text("History button")
            }
        }
    }
}

#Preview {
    ExerciseView(index: 0)
}
