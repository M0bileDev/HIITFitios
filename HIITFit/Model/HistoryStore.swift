//
//  HistoryStore.swift
//  HIITFit
//
//  Created by Damian Ogórek on 17/02/2026.
//

internal import Combine
import Foundation

struct ExerciseDay: Identifiable {
    let id = UUID()
    let date: Date
    var exercises: [String] = []
}

class HistoryStore: ObservableObject {
    @Published var exerciseDays: [ExerciseDay] = []

    init() {
        //compiler directive
        #if DEBUG
            createDevData()
        #endif
    }

    func addDoneExercise(_ exerciseName: String) {
        let today = Date()
        if today.isSameDay(from: exerciseDays[0].date) {
            print("Adding \(exerciseName)")
            exerciseDays[0].exercises.append(exerciseName)
        } else {
            exerciseDays.insert(
                ExerciseDay(date: today, exercises: [exerciseName]),
                at: 0
            )
        }
    }
}
