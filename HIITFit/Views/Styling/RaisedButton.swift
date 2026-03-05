//
//  RaisedButton.swift
//  HIITFit
//
//  Created by Damian Ogórek on 05/03/2026.
//

import SwiftUI

struct RaisedButton: View {
    var body: some View {
        Button(action: {}, label: { Text("Get started") })
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ZStack {
        RaisedButton().padding(20)
    }.background(Color.background)
}
