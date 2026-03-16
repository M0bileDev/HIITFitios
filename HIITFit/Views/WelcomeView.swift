//
//  WelcomeView.swift
//  HIITFit
//
//  Created by Damian Ogórek on 12/02/2026.
//

import SwiftUI

struct WelcomeView: View {

    @State private var showHistory = false
    @State private var showReports = false
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
    var reportsButton: some View {
        Button(
            action: {
                showReports.toggle()
            },
            label: {
                Text("Reports")
                    .fontWeight(.bold)
                    .padding([.leading, .trailing], 5)
            }
        )
        .padding(.bottom, 5)
        .buttonStyle(EmbossedButtonStyle())
    }

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HeaderView(selectedTab: $selectedTab, titleText: "Welcome")
                    .containerRelativeFrame(.vertical) { length, _ in
                        length * 0.2
                    }
                ContainerView {
                    VStack {
                        ZStack {
                            WelcomeView.bubbles.offset(y: 10)
                            WelcomeView.welocomeTtile.offset(x: 55, y: -100)
                            WelcomeView.welocomeSubtitle
                                .offset(x: 105, y: -55)
                        }
                        getStartedButton
                        Spacer()
                        HStack(spacing: 32) {
                            historyButton
                            reportsButton
                        }
                    }.padding(.top, 20)
                        .sheet(isPresented: $showHistory) {
                            HistoryView(showHistory: $showHistory)
                        }
                        .sheet(
                            isPresented: $showReports,
                            content: {
                                BarChartWeekView()
                            }
                        )
                }.containerRelativeFrame(.vertical) { length, _ in
                    length * 0.8
                }
            }
        }
    }

}

#Preview {
    WelcomeView(selectedTab: .constant(9))
}
