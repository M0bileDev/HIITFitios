//
//  HistoryStore.swift
//  HIITFit
//
//  Created by Damian Ogórek on 17/02/2026.
//

import Foundation

struct ExerciseDay: Identifiable {
    let id = UUID()
    let date: Date
    var exercises: [String] = []
}

struct HistoryStore {
    var exerciseDay: [ExerciseDay] = []
}
