//
//  VideoPlayerView.swift
//  Africa
//
//  Created by 정현우 on 2023/07/16.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
	// MARK: - Preview
	var videoSelected: String
	var videoTitle: String
	
	// MARK: - Body
    var body: some View {
		VStack {
			VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4"))
			.overlay(alignment: .topLeading, content: {
				Image("logo")
					.resizable()
					.scaledToFit()
					.frame(width: 32, height: 32)
					.padding(.top, 6)
					.padding(.horizontal, 8)
			})
		} //: VStack
		.tint(.accentColor)
		.navigationTitle(videoTitle)
		.navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Preview
struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView {
			VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
		}
    }
}
