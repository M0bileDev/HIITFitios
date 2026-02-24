//
//  ExerciseView.swift
//  HIITFit
//
//  Created by Damian Ogórek on 12/02/2026.
//

import AVKit
import SwiftUI

struct ExerciseView: View {

    @State private var showHistory = false
    @State private var rating = 0
    @Binding var selectedTab: Int

    let index: Int
    var exercise: Exercise {
        Exercise.exercises[index]
    }
    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }
    var startButton: some View {
        Button("Start exercise") {}
    }
    var doneButton: some View {
        Button("Done") {
            selectedTab = lastExercise ? 9 : selectedTab + 1
        }
    }

    var body: some View {
        // container view that provides with the screen’s measurements
        GeometryReader { geometry in
            VStack {
                HeaderView(
                    selectedTab: $selectedTab,
                    titleText: exercise.exerciseName
                ).padding(.bottom)
                VideoPlayerView(
                    videoName: exercise.videoName,
                    videExtension: "mp4"
                ).frame(height: geometry.size.height * 0.45)
                TimerView(fontSize: geometry.size.height * 0.07)
                HStack(spacing: 150) {
                    startButton
                    doneButton
                }.font(.title3).padding()
                RatingView(rating: $rating).padding()
                Spacer()
                Button("History") {
                    showHistory.toggle()
                }.padding(.bottom).sheet(
                    isPresented: $showHistory,
                    content: {
                        HistoryView(showHistory: $showHistory)
                    }
                )
            }
        }
    }
}

#Preview {
    ExerciseView(selectedTab: .constant(1), index: 0)
}
