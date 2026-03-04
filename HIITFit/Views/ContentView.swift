//
//  ContentView.swift
//  HIITFit
//
//  Created by Damian Ogórek on 10/02/2026.
//

import SwiftUI

struct ContentView: View {

    @SceneStorage("selectedTab") private var selectedTab = 9

    var body: some View {
        TabView(selection: $selectedTab) {
            WelcomeView(selectedTab: $selectedTab).tag(9)
            ForEach(
                // range is not longer fixed, need to provide id
                Exercise.exercises.indices,
                // \.self -> each element it is own identifier
                id: \.self,
                content: { index in
                    ExerciseView(selectedTab: $selectedTab, index: index).tag(
                        index
                    )
                }
            )
            Text("Execrice 2")
        }
        .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
    }
}

#Preview {
    ContentView().environmentObject(HistoryStore())
}
