//
//  HeaderView.swift
//  HIITFit
//
//  Created by Damian Ogórek on 13/02/2026.
//

import SwiftUI

struct HeaderView: View {

    @Binding var selectedTab: Int
    let titleText: String

    var body: some View {
        VStack {
            Text(titleText)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding()
                .foregroundStyle(Color.white)
            HStack {
                ForEach(
                    Exercise.exercises.indices,
                    id: \.self,
                    content: { index in
                        let opacity = index == selectedTab ? 0.5 : 0
                        ZStack {
                            Image(systemName: "circlebadge.fill").font(.largeTitle)
                                .foregroundStyle(Color.white)
                                .opacity(opacity)
                            Image(systemName: "circlebadge.fill")
                                .font(.headline)
                                .foregroundStyle(Color.white)
                                
                        }
                    }
                )

            }.font(.title2)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ZStack {
        HeaderView(selectedTab: .constant(0), titleText: "Squat")
    }.background(Color.black)
}
