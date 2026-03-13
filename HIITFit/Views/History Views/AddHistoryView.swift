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
            DatePicker(
                "Choose date",
                selection: $exerciseDate,
                in: ...Date(),
                displayedComponents: .date
            ).datePickerStyle(.graphical)
        }.padding()
    }
}

#Preview {
    AddHistoryView(addMode: .constant(true))
}
