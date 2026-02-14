//
//  ContentView.swift
//  HIITFit
//
//  Created by Damian Ogórek on 10/02/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            WelcomeView()
            ForEach(
                // range is not longer fixed, need to provide id 
                Exercise.exercises.indices,
                // \.self -> each element it is own identifier
                id: \.self,
                content: { index in
                    ExerciseView(index: index)
                }
            )
            Text("Execrice 2")
        }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
    }
}

#Preview {
    ContentView()
}
