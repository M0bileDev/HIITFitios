//
//  WelcomeView.swift
//  HIITFit
//
//  Created by Damian Ogórek on 12/02/2026.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            VStack {
                HeaderView(titleText: "Welcome")
                Spacer()
                Button("History") {}.padding(.bottom)
            }
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Get fit").font(.largeTitle)
                        Text("with hight intensity interval training").font(.headline)
                    }
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
}
