//
//  HeaderView.swift
//  HIITFit
//
//  Created by Damian Ogórek on 13/02/2026.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            Text(exerciseNames[index])
                .font(.largeTitle)
            HStack {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
                Image(systemName: "4.circle")
            }.font(.title2)
        }
    }
}
