//
//  AddHistoryView.swift
//  HIITFit
//
//  Created by Damian Ogórek on 10/03/2026.
//

import SwiftUI

struct AddHistoryView: View {

    @Binding var addMode: Bool
    @State private var exerciseDate = Date()

    var body: some View {
        VStack {
            ZStack {
                Text("Add exercise").font(.title)
                Button("Done") {
                    addMode = false
                }.frame(maxWidth: .infinity, alignment: .trailing)
            }
            ButtonsView(date: $exerciseDate)
            DatePicker(
                "Choose date",
                selection: $exerciseDate,
                in: ...Date(),
                displayedComponents: .date
            ).datePickerStyle(.graphical)
        }.padding()
    }

    struct ButtonsView: View {

        @EnvironmentObject var history: HistoryStore
        @Binding var date: Date

        var body: some View {
            HStack {
                ForEach(
                    Exercise.exercises.indices,
                    id: \.self,
                    content: { index in
                        let exerciseName = Exercise.exercises[index]
                            .exerciseName
                        Button(action: {}, label: { Text(exerciseName) })
                    }
                )
            }.buttonStyle(EmbossedButtonStyle())
        }
    }
}

#Preview {
    AddHistoryView(addMode: .constant(true))
}
