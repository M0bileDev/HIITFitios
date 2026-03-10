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
    Section(
      header:
        Text(day.date.formatted(from: "MMM d"))
        .font(.headline)) {
          exerciseView(day: day)
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
      Form {
        ForEach(history.exerciseDays) { day in
          dayView(day: day)
        }
      }
    }
  }
}

#Preview {
  let history = HistoryStore(preview: true)
  HistoryView(showHistory: .constant(true))
    .environmentObject(history)
}
