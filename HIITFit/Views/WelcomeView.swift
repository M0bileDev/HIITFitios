//
//  WelcomeView.swift
//  HIITFit
//
//  Created by Damian Ogórek on 12/02/2026.
//

import SwiftUI

struct WelcomeView: View {

    @State private var showHistory = false
    @Binding var selectedTab: Int

    var body: some View {
        ZStack {
            VStack {
                HeaderView(selectedTab: $selectedTab, titleText: "Welcome")
                Spacer()
                Button("History") {
                    showHistory.toggle()
                }.padding(.bottom)
                    .sheet(
                        isPresented: $showHistory,
                        content: {
                            HistoryView(showHistory: $showHistory)
                        }
                    )
            }
            VStack {
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text("Get fit").font(.largeTitle)
                        Text("with hight intensity interval training").font(
                            .headline
                        )
                    }
                    Image("step-up")
                        .resizedToFill(width: 240, height: 240)
                        .clipShape(
                            Circle()
                        )
                }
                Button(
                    action: {
                        selectedTab = 0
                    },
                    label: {
                        Text("Get started")
                        Image(systemName: "arrow.right.circle")
                    }
                )
                .font(.title2)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20).stroke(
                        Color.gray,
                        lineWidth: 2
                    )
                )
            }
        }
    }

}

#Preview {
    WelcomeView(selectedTab: .constant(9))
}
