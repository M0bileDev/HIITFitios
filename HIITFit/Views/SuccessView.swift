//
//  SuccessView.swift
//  HIITFit
//
//  Created by Damian Ogórek on 20/02/2026.
//

import SwiftUI

struct SuccessView: View {
    var body: some View {
        ZStack(alignment: .center) {
            VStack {
                Image(systemName: "hand.raised.fill").resizedToFill(
                    width: 100,
                    height: 100
                )
                .foregroundColor(.purple)
                Text("High five!").padding(.top).font(.largeTitle).bold()
                Text(
                    "Good job completing all four exercices!\nRemember tomorrow's another day.\nSo eat well and get some rest."
                ).font(.default)
                    .foregroundColor(.gray).multilineTextAlignment(.center)

            }
            VStack {
                Spacer()
                Button("Continue", action: {}).padding(.bottom)

            }

        }
    }
}

#Preview {
    SuccessView()
}
