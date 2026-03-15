//
//  BarChartDayView.swift
//  HIITFit
//
//  Created by Damian Ogórek on 15/03/2026.
//

import Charts
import SwiftUI

struct BarChartDayView: View {

    let day: ExerciseDay

    var body: some View {
        Chart {
            ForEach(
                Exercise.names,
                id: \.self,
                content: { name in
                    BarMark(
                        x: .value(name, name),
                        y: .value(
                            "Total count",
                            day.countExercise(exercise: name)
                        )
                    )
                    .foregroundStyle(Color.historyBar)
                    RuleMark(y: .value("Exercise", 1))
                        .foregroundStyle(.red)
                }
            )
        }
    }
}

#Preview {
    let history = HistoryStore(preview: true)
    return BarChartDayView(day: history.exerciseDays[1])
        .environmentObject(history)
}
