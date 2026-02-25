//
//  CountdownView.swift
//  HIITFit
//
//  Created by Damian Ogórek on 25/02/2026.
//

import SwiftUI

struct CountdownView: View {
    
    @Binding var timeRemaining: Int
    let date: Date
    let size: Double
    
    var body: some View {
        Text("\(timeRemaining)")
            .font(.system(size: size, design: .rounded))
            .padding()
            .onChange(of: date){
                timeRemaining -= 1
            }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CountdownView(timeRemaining: .constant(30), date: Date.now, size: 10.0)
}
