//
//  HIITFitApp.swift
//  HIITFit
//
//  Created by Damian Ogórek on 10/02/2026.
//

import SwiftUI

@main
struct HIITFitApp: App {

    @StateObject private var historyStore = HistoryStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: {
                    print(URL.documentsDirectory)
                }).environmentObject(historyStore)
                .alert(
                    "History",
                    isPresented: $historyStore.loadingError,
                    actions: {
                        Button("OK") {}
                    },
                    message: {
                        Text(
                            """
                            Unfortunately we can't load your past history.
                            Email support:
                            super@support.com
                            """
                        )
                    }
                )
        }
    }
}
