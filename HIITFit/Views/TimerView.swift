//
//  TimerView.swift
//  HIITFit
//
//  Created by Damian Ogórek on 15/02/2026.
//

import SwiftUI

struct TimerView: View {
    // alias for Double
    let interval: TimeInterval = 30
    var fontSize: CGFloat = 0.0
    
    var body: some View {
        Text(
            //current date and time -> adds interval seconds to this value
            Date().addingTimeInterval(interval),
            style: .timer
        ).font(.system(size: fontSize))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TimerView(fontSize: 100.0)
}
