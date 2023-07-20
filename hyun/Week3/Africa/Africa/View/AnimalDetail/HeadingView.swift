//
//  HeadingView.swift
//  Africa
//
//  Created by 정현우 on 2023/07/16.
//

import SwiftUI

struct HeadingView: View {
	// MARK: - Property
	var headingImage: String
	var headingText: String
	
	// MARK: - Body
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

// MARK: - Preview
struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
    }
}
