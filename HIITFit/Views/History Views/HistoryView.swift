//
//  HistoryVIew.swift
//  HIITFit
//
//  Created by Damian Ogórek on 16/02/2026.
//

import SwiftUI

struct HistoryView: View {
    @Binding var showHistory: Bool
    @EnvironmentObject var history: HistoryStore

    var headerView: some View {
        HStack {
            Spacer()
            Text("History")
                .font(.title)
            Spacer()
            Button {
                showHistory.toggle()
            } label: {
                Image(systemName: "xmark.circle")
            }
            .font(.title)
        }
    }

    func dayView(day: ExerciseDay) -> some View {
        DisclosureGroup {
            exerciseView(day: day)
        } label: {
            Text(day.date.formatted(from: "d MMM YYYY"))
                .font(.headline)
        }
    }

    func exerciseView(day: ExerciseDay) -> some View {
        ForEach(day.uniqueExercises, id: \.self) { exercise in
            Text(exercise)
                .badge(day.countExercise(exercise: exercise))
        }
    }

    var body: some View {
        VStack {
            headerView
                .padding()
            List($history.exerciseDays, editActions: [.delete]) { $day in
                dayView(day: day)
            }
        }
        .onDisappear {
            try? history.save()
        }
    }
}

#Preview {
    let history = HistoryStore(preview: true)
    HistoryView(showHistory: .constant(true))
        .environmentObject(history)
}
