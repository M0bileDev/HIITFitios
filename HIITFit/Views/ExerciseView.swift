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
    // alias for Double
    let interval: TimeInterval = 30
    var body: some View {
        // container view that provides with the screen’s measurements
        GeometryReader { geometry in
            VStack {
                HeaderView(exerciceName: exercise.exerciseName).padding(.bottom)
                if let url = Bundle.main.url(
                    forResource: exercise.videoName,
                    withExtension: "mp4"
                ) {
                    VideoPlayer(player: AVPlayer(url: url)).frame(
                        height: geometry.size.height * 0.45
                    )
                } else {
                    Text("Couldn't find \(exercise.videoName).mp4")
                        .foregroundColor(
                            .red
                        )
                }
                Text(
                    //current date and time -> adds interval seconds to this value
                    Date().addingTimeInterval(interval),
                    style: .timer
                ).font(.system(size: geometry.size.height * 0.07))
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
