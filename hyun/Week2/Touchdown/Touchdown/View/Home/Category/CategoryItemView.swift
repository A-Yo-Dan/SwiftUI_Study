//
//  CategoryItemView.swift
//  Touchdown
//
//  Created by 정현우 on 2023/07/10.
//

import SwiftUI

struct CategoryItemView: View {
	// MARK: - Preview
	let category: Category
	
	// MARK: - Body
    var body: some View {
        Button(action: {
			
		}, label: {
			HStack(alignment: .center, spacing: 6) {
				Image(category.image)
					.renderingMode(.template)
					.resizable()
					.scaledToFit()
					.frame(width: 30, height: 30, alignment: .center)
					.foregroundColor(.gray)
				
				Text(category.name.uppercased())
					.fontWeight(.light)
					.foregroundColor(.gray)
				
				Spacer()
			}
			.padding()
			.background(Color.white.cornerRadius(12))
			.background(
				RoundedRectangle(cornerRadius: 12)
					.stroke(.gray, lineWidth: 1)
			)
		})
    }
}

// MARK: - Preview
struct CategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemView(category: categories[0])
			.previewLayout(.sizeThatFits)
			.padding()
			.background(colorBackground)
    }
}
