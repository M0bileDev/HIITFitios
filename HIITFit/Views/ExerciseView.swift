//
//  ExerciseView.swift
//  HIITFit
//
//  Created by Damian Ogórek on 12/02/2026.
//

import AVKit
import SwiftUI

struct ExerciseView: View {
    @Binding var selectedTab: Int
    let index: Int
    var exercise: Exercise {
        Exercise.exercises[index]
    }
    var lastExercise: Bool{
        index + 1 == Exercise.exercises.count
    }

    var body: some View {
        // container view that provides with the screen’s measurements
        GeometryReader { geometry in
            VStack {
                HeaderView(titleText: exercise.exerciseName).padding(.bottom)
                VideoPlayerView(
                    videoName: exercise.videoName,
                    videExtension: "mp4"
                ).frame(height: geometry.size.height * 0.45)
                TimerView(fontSize: geometry.size.height * 0.07)
                HStack(spacing: 150) {
                    Button("Start exercise") {

                    }
                    Button("Done") {
                        selectedTab = lastExercise ? 9 : selectedTab + 1
                    }
                }.font(.title3).padding()
                RatingView().padding()
                Spacer()
                Button("History") {}.padding(.bottom)
            }
        }
    }
}

#Preview {
    ExerciseView(selectedTab: .constant(1), index: 0)
}
