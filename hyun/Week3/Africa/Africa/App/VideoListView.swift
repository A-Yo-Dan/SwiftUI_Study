//
//  VideoListView.swift
//  Africa
//
//  Created by 정현우 on 2023/07/15.
//

import SwiftUI

struct VideoListView: View {
	// MARK: - Property
	@State var videos: [Video] = Bundle.main.decode("videos.json")
	let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
	
	// MARK: - Body
    var body: some View {
		NavigationView {
			List {
				ForEach(videos) { item in
					NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
						VideoListItemView(video: item)
							.padding(.vertical, 8)
					}
				}
			} //: List
			.listStyle(.insetGrouped)
			.navigationBarTitle("Videos")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing, content: {
					Button(action: {
						videos.shuffle()
						hapticImpact.impactOccurred()
					}, label: {
						Image(systemName: "arrow.2.squarepath")
					})
				})
			}
		} //: NavigationView
    }
}

// MARK: - Preview
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
