//
//  BarChartWeekView.swift
//  HIITFit
//
//  Created by Damian Ogórek on 15/03/2026.
//

import Charts
import SwiftUI

struct BarChartWeekView: View {

    @EnvironmentObject var historyStore: HistoryStore
    @State private var weekData: [ExerciseDay] = []
    @State private var displayBarChart: Bool = true

    var linearChart: some View {
        Chart(weekData) { day in
            LineMark(
                x: .value("Date", day.date, unit: .day),
                y: .value("Total count", day.exercises.count)
            )
            .symbol(.circle)
            .interpolationMethod(.catmullRom)

            RuleMark(y: .value("Exercises per day", 4))
                .foregroundStyle(.red)
        }
    }

    var barChart: some View {
        Chart(
            weekData,
            content: { day in

                ForEach(
                    Exercise.names,
                    id: \.self,
                    content: { name in
                        BarMark(
                            x: .value("Date", day.date, unit: .day),
                            y: .value(
                                "Total count",
                                day.countExercise(exercise: name)
                            )
                        )
                        .foregroundStyle(by: .value("Exercise", name))

                    }
                )
                RuleMark(y: .value("Exercices per day", 4))
                    .foregroundStyle(.red)
            }
        )
        .chartForegroundStyleScale([
            "Burpee": Color("chart-burpee"),
            "Squat": Color("chart-squat"),
            "Step Up": Color("chart-step-up"),
            "Sun Salute": Color("chart-sun-salute"),
        ])
    }

    var body: some View {
        VStack {
            if displayBarChart {
                barChart
            } else {
                linearChart
            }
            Toggle(isOn: $displayBarChart) {
                Text("Bar chart")
            }
        }.padding()
            .onAppear(perform: {
                let firstDate = historyStore.exerciseDays.first?.date ?? Date()
                let previousWeek = firstDate.previousSevenDays
                weekData = previousWeek.map { date in
                    historyStore.exerciseDays.first(where: {
                        $0.date.isSameDay(from: date)
                    }) ?? ExerciseDay(date: date)
                }
            })
    }
}

#Preview {
    BarChartWeekView().environmentObject(HistoryStore(preview: true))
}
