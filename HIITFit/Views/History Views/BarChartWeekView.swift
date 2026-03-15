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

    var body: some View {
        Chart(
            weekData,
            content: { day in
                LineMark(
                    x: .value("Date", day.date, unit: .day),
                    y: .value("Total count", day.exercises.count)
                )
                .symbol(.circle)
                .interpolationMethod(.catmullRom)
                RuleMark(y: .value("Exercices per day", 4))
                    .foregroundStyle(.red)
            }
        ).onAppear(perform: {
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
