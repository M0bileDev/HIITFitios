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

    var getStartedButton: some View {
        RaisedButton(buttonText: "Get started") {
            selectedTab = 0
        }
        .padding()

    }
    var historyButton: some View {
        Button(
            action: {
                showHistory.toggle()
            },
            label: {
                Text("History")
                    .fontWeight(.bold)
                    .padding([.leading, .trailing], 5)
            }
        )
        .padding(.bottom, 5)
        .buttonStyle(EmbossedButtonStyle())
    }

    var body: some View {
        ZStack {
            VStack {
                HeaderView(selectedTab: $selectedTab, titleText: "Welcome")
                Spacer()
                VStack {
                    ZStack {
                        WelcomeView.bubbles.offset(y: 10)
                        WelcomeView.welocomeTtile.offset(x: 55, y: -100)
                        WelcomeView.welocomeSubtitle
                            .offset(x: 105, y: -55)
                    }
                    getStartedButton
                    Spacer()
                    historyButton
                }
                .sheet(isPresented: $showHistory) {
                    HistoryView(showHistory: $showHistory)
                }
            }
        }
    }

}

#Preview {
    WelcomeView(selectedTab: .constant(9))
}
