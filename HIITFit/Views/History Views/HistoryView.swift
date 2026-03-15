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
    @State private var addMode = false

    var headerView: some View {
        HStack {
            Button(
                action: {
                    addMode = true
                },
                label: {
                    Image(systemName: "plus")
                }
            ).padding(.trailing)
            EditButton()
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
            BarChartDayView(day: day).deleteDisabled(true)
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
            Group {
                if addMode {
                    Text("History").font(.title)
                } else {
                    headerView
                }
            }
            //keep the same padding in both views
            .padding()
            List($history.exerciseDays, editActions: [.delete]) { $day in
                dayView(day: day)
            }
            if addMode {
                AddHistoryView(addMode: $addMode)
                    .background(
                        Color.primary.colorInvert().shadow(
                            color: .primary.opacity(0.4),
                            radius: 7
                        )
                    )
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
