//
//  ExerciseView.swift
//  HIITFit
//
//  Created by Damian Ogórek on 12/02/2026.
//

import SwiftUI

struct ExerciseView: View {
    let videoNames = ["squat", "steu-up","burpee","sun-salute"]
    let exerciseNames = ["Squat", "Step Up", "Burpee", "Sun Salute"]
    let index: Int
    
    var body: some View {
        VStack {
            VStack {
                Text(exerciseNames[index])
                    .font(.largeTitle)
                HStack {
                    Image(systemName: "1.circle").font(.largeTitle)
                    Image(systemName: "2.circle")
                    Image(systemName: "3.circle")
                    Image(systemName: "4.circle")
                }.font(.title2)
            }
            Text("Video player")
            Text("Timer")
            Text("Start/Done button")
            Text("Rating")
            Text("History button")
        }
    }
}

#Preview {
    ExerciseView(index: 0)
}
