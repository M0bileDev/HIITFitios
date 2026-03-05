//
//  RaisedButton.swift
//  HIITFit
//
//  Created by Damian Ogórek on 05/03/2026.
//

import SwiftUI

struct RaisedButton: View {
    var body: some View {
        Button(
            action: {},
            label: { Text("Get started").raisedButtonTextStyle() }
        )
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ZStack {
        RaisedButton().padding(20)
    }.background(Color.background)
}

extension Text {
    func raisedButtonTextStyle() -> some View {
        self
            .font(.body)
            .fontWeight(.bold)
    }
}
