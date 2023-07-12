//
//  VideoListView.swift
//  Africa
//
//  Created by 서은수 on 2023/07/10.
//

import SwiftUI

struct VideoListView: View {
    
    // MARK: - PROPERTIES
    
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    
    let hapticFeedback = UIImpactFeedbackGenerator(style: .medium) // style은 햅틱 세기 설정하는 것
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            List(videos) { video in
                NavigationLink(destination: VideoPlayerView(videoSelected: video.id, videoTitle: video.name)) {
                    VideoListItemView(video: video)
                        .padding(.vertical, 8)
                }
            } //: LIST
            .listStyle(.insetGrouped)
            .navigationTitle(Text("Videos")) // NavigationView 괄호 안에 적어야 적용이 됨
            .navigationBarTitleDisplayMode(.inline) // 위와 동일
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // Shuffle videos
                        videos.shuffle()
                        // 촉각 피드백 발생
                        hapticFeedback.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }

                }
            }
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
