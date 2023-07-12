//
//  CategoryGridView.swift
//  Touchdown
//
//  Created by 정현우 on 2023/07/10.
//

import SwiftUI

struct CategoryGridView: View {
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			LazyHGrid(
				rows: gridLayout,
				alignment: .center,
				spacing: columnSpacing,
				pinnedViews: [],
				content: {
					Section(content: {
						ForEach(categories) { category in
							CategoryItemView(category: category)
						}
					}, header: {
						SectionView(rotateClockwise: false)
					}, footer: {
						SectionView(rotateClockwise: true)
					})
				})
			.frame(height: 140)
			.padding(.horizontal, 15)
			.padding(.vertical, 10)
		}
    }
}

struct CategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryGridView()
			.previewLayout(.sizeThatFits)
			.padding()
			.background(colorBackground)
    }
}
