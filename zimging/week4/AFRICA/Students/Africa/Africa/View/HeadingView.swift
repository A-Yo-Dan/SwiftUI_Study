//
//  HeadingView.swift
//
//  Created by YOUJIM on 2023/07/26.
//

import SwiftUI

struct HeadingView: View {
  // MARK: - PROPERTIES
  
  var headingImage: String
  var headingText: String
  
  // MARK: - BODY

  var body: some View {
    HStack {
      Image(systemName: headingImage)
        .foregroundColor(.accentColor)
        .imageScale(.large)
      
      Text(headingText)
        .font(.title3)
        .fontWeight(.bold)
    }
    .padding(.vertical)
  }
}

// MARK: - PREVIEW

struct HeadingView_Previews: PreviewProvider {
  static var previews: some View {
    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
