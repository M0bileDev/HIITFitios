//
//  HistoryVIew.swift
//  HIITFit
//
//  Created by Damian Ogórek on 16/02/2026.
//

import SwiftUI

struct HistoryView: View {
    let today = Date()
    //time interval of two days
    let yesterday = Date().addingTimeInterval(-86400)
    
    let exercises1 = ["Squat", "Step Up", "Burpee", "Sun Salute"]
    let exercises2 = ["Squat", "Step Up", "Burpee"]
    
    var body: some View {
        VStack{
            Text("History").font(.title).padding()
        }
    }
}

#Preview {
    HistoryView()
}
