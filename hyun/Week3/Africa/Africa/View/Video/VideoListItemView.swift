//
//  VideoListItem.swift
//  Africa
//
//  Created by 정현우 on 2023/07/16.
//

import SwiftUI

struct VideoListItemView: View {
	// MARK: - Property
	let video: Video
	
	// MARK: - Body
	var body: some View {
		HStack(spacing: 10) {
			ZStack {
				Image(video.thumbnail)
					.resizable()
					.scaledToFit()
					.frame(height: 80)
					.cornerRadius(9)
				
				Image(systemName: "play.circle")
					.resizable()
					.scaledToFit()
					.frame(height: 32)
					.shadow(radius: 4)
			} //: ZStack
			
			VStack(alignment: .leading, spacing: 10) {
				Text(video.name)
					.font(.title2)
					.fontWeight(.heavy)
					.foregroundColor(.accentColor)
				Text(video.headline)
					.font(.footnote)
					.multilineTextAlignment(.leading)
					.lineLimit(2)
			} //: VStack
		} //: HStack
	}
}

// MARK: - Preview
struct VideoListItem_Previews: PreviewProvider {
	static let videos: [Video] = Bundle.main.decode("videos.json")
    static var previews: some View {
        VideoListItemView(video: videos[0])
    }
}
