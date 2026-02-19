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
                HeaderView(titleText: exercise.exerciseName).padding(.bottom)
                VideoPlayerView(
                    videoName: exercise.videoName,
                    videExtension: "mp4"
                ).frame(height: geometry.size.height * 0.45)
                TimerView(fontSize: geometry.size.height * 0.07)
                Button("Start/Done") {}.font(.title3).padding()
                RatingView().padding()
                Spacer()
                Button("History") {}.padding(.bottom)
            }
        }
    }
}

#Preview {
    ExerciseView(index: 0)
}
