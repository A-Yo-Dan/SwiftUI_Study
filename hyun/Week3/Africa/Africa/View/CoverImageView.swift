//
//  CoverImageView.swift
//  Africa
//
//  Created by 정현우 on 2023/07/15.
//

import SwiftUI

struct CoverImageView: View {
	// MARK: - Property
	let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
	
	// MARK: - Body
    var body: some View {
		TabView {
			ForEach(coverImages) { item in
				Image(item.name)
					.resizable()
					.scaledToFill()
			}
		} //: Tab
		.tabViewStyle(.page)
    }
}

// MARK: - Preview
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
			.previewLayout(.fixed(width: 400, height: 300))
    }
}
