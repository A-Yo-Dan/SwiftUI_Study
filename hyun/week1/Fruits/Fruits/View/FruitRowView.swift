//
//  FruitRowView.swift
//  Fruits
//
//  Created by 정현우 on 2023/07/05.
//

import SwiftUI

struct FruitRowView: View {
	// MARK: - Properties
	var fruit: Fruit
	
	// MARK: - Body
    var body: some View {
		HStack {
			Image(fruit.image)
				.renderingMode(.original)
				.resizable()
				.scaledToFit()
				.frame(width: 80, height: 80, alignment: .center)
				.shadow(color: .black.opacity(0.3), radius: 3, x: 2, y: 2)
				.background(
					LinearGradient(
						gradient: Gradient(colors: fruit.gradientColors),
						startPoint: .top,
						endPoint: .bottom
					)
				)
				.cornerRadius(8)
			
			VStack(alignment: .leading, spacing: 5) {
				Text(fruit.title)
					.font(.title2)
					.fontWeight(.bold)
				Text(fruit.headline)
					.font(.caption)
					.foregroundColor(.secondary)
			}
			
		}
    }
}

struct FruitRowView_Previews: PreviewProvider {
    static var previews: some View {
        FruitRowView(fruit: fruitsData[0])
			.previewLayout(.sizeThatFits)
    }
}
