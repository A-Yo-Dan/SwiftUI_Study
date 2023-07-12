//
//  VideoPlayerView.swift
//  Africa
//
//  Created by 서은수 on 2023/07/12.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    // MARK: - PROPERTIES
    
    var videoSelected: String
    var videoTitle: String
    
    
    // MARK: - BODY
    var body: some View {
        VStack {
            VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: videoSelected, withExtension: "mp4")!)) {
    //            Text("HI")
            }
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal, 8)
                ,alignment: .topLeading
            )
        } //: VSTACK
        .foregroundColor(.accentColor)
        .navigationTitle(videoTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - PREVIEW

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
    }
}
