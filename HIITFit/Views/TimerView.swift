//
//  TimerView.swift
//  HIITFit
//
//  Created by Damian Ogórek on 15/02/2026.
//

import SwiftUI

struct TimerView: View {

    @State private var timeRemaining: Int = 3
    @Binding var timerDone: Bool
    let size: Double

    var body: some View {
        TimelineView(
            .animation(
                minimumInterval: 1.0,
                paused: timeRemaining <= 0
            ),
            content: { context in
                CountdownView(
                    timeRemaining: $timeRemaining,
                    date: context.date,
                    size: size
                ).onChange(of: timeRemaining){
                    if(timeRemaining < 1){
                        timerDone = true
                    }
                }
            }
        )
    }
}

#Preview {
    TimerView(timerDone: .constant(false), size: 90)
}
