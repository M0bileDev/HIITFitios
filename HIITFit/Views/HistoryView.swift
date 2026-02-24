//
//  HistoryVIew.swift
//  HIITFit
//
//  Created by Damian Ogórek on 16/02/2026.
//

import SwiftUI

struct HistoryView: View {
    
    @Binding var showHistory: Bool
    
    let history = HistoryStore()

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button(
                action: {
                    showHistory.toggle()
                },
                label: {
                    Image(systemName: "xmark.circle")
                }
            ).font(.title).padding()
            VStack {
                Text("History").font(.title).padding()
                Form {
                    ForEach(
                        history.exerciseDays,
                        content: { day in
                            Section(
                                header: Text(
                                    day.date.formatted(from: "dd MMM")
                                ),
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
}

#Preview {
    HistoryView(showHistory: .constant(true))
}
