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
                HStack(alignment:.bottom) {
                    VStack(alignment: .leading) {
                        Text("Get fit").font(.largeTitle)
                        Text("with hight intensity interval training").font(.headline)
                    }
                    Image("step-up")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 240, height: 240)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }

}

#Preview {
    WelcomeView()
}
