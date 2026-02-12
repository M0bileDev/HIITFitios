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
                0..<4,
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
