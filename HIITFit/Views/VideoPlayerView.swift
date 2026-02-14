//
//  VideoPlayerView.swift
//  HIITFit
//
//  Created by Damian Ogórek on 15/02/2026.
//

import AVKit
import SwiftUI

struct VideoPlayerView: View {

    var videoName: String = ""
    var videExtension: String = ""

    var body: some View {
        if let url = Bundle.main.url(
            forResource: videoName,
            withExtension: videExtension
        ) {
            VideoPlayer(player: AVPlayer(url: url))
        } else {
            Text("Couldn't find \(videoName).\(videExtension)")
                .foregroundColor(
                    .red
                )
        }

    }
}

#Preview {
    VideoPlayerView(videoName: Exercise.exercises[0].videoName, videExtension: "mp4")
}
