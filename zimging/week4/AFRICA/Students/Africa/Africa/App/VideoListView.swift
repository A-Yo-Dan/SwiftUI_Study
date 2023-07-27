//
//  VideoListView.swift
//
//  Created by YOUJIM on 2023/07/26.
//

import SwiftUI

struct VideoListView: View {
  // MARK: - PROPERTIES
  
  @State var videos: [Video] = Bundle.main.decode("videos.json")
  
  let hapticImpact = UIImpactFeedbackGenerator(style: .medium)

  // MARK: - BODY

  var body: some View {
    NavigationView {
      List {
        ForEach(videos) { item in
          NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
            VideoListItemView(video: item)
              .padding(.vertical, 8)
          }
        } //: LOOP
      } //: LIST
      .listStyle(InsetGroupedListStyle())
      .navigationBarTitle("Videos", displayMode: .inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: {
            // Shuffle videos
            videos.shuffle()
            hapticImpact.impactOccurred()
          }) {
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
      .previewDevice("iPhone 12 Pro")
  }
}
