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
            Text("Welcome").tabItem { Text("Welcome") }
            Text("Execrice 1").tabItem { Text("Execrice 1") }
            Text("Execrice 2").tabItem { Text("Execrice 2") }
        }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

#Preview {
    ContentView()
}
