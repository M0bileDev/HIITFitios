//
//  ImageExtension.swift
//  HIITFit
//
//  Created by Damian Ogórek on 20/02/2026.
//

import SwiftUI

extension Image {
    func resizedToFill(width: CGFloat, height: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: height)
    }
}
