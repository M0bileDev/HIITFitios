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

    @Published var loadingError = false
    @Published var exerciseDays: [ExerciseDay] = []

    var dataURL: URL {
        URL.documentsDirectory.appendingPathExtension("history.plist")
    }

    init() {
        do {
            try load()
        } catch {
            print("Error:", error)
            loadingError.toggle()
        }

        //compiler directive
        #if DEBUG
            //            createDevData()
        #endif
        print("Initializing HistoryStore")
    }

    func addDoneExercise(_ exerciseName: String) {
        let today = Date()

        if let firstDate = exerciseDays.first?.date,
            today.isSameDay(from: firstDate)
        {
            print("Adding \(exerciseName)")
            exerciseDays[0].exercises.append(exerciseName)
        } else {
            exerciseDays.insert(
                ExerciseDay(date: today, exercises: [exerciseName]),
                at: 0
            )
        }

        print("History: ", exerciseDays)
    }

    func save() throws {
        let plistData = exerciseDays.map {
          [
            $0.id.uuidString,
            $0.date,
            $0.exercises
          ]
        }
    }
}

enum FileError: Error {
    case loadFailure
    case saveFailure
}

func load() throws {
    //    throw FileError.loadFailure
}
