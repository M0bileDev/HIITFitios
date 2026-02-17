//
//  HistoryVIew.swift
//  HIITFit
//
//  Created by Damian Ogórek on 16/02/2026.
//

import SwiftUI

struct HistoryView: View {
    let history = HistoryStore()

    var body: some View {
        VStack {
            Text("History").font(.title).padding()
            Form {
                ForEach(
                    history.exerciseDays,
                    content: { day in
                        Section(
                            header: Text(day.date.formatted(from: "dd MMM")),
                            content: {
                                ForEach(
                                    day.exercises,
                                    id: \.self,
                                    content: { exercise in
                                        Text(exercise)
                                    }
                                )
                            }
                        )
                    }
                )
            }
        }
    }
}

#Preview {
    HistoryView()
}
