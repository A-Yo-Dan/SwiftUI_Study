//
//  CardView.swift
//  Honeymoon
//
//  Created by 정현우 on 2023/07/29.
//

import SwiftUI

struct CardView: View, Identifiable {
	let id = UUID()
	let honeymoon: Destination
	
	var body: some View {
		Image(honeymoon.image)
			.resizable()
			.cornerRadius(24)
			.scaledToFit()
			.frame(minWidth: 0, maxWidth: .infinity)
			.overlay(alignment: .bottom, content: {
				VStack(alignment: .center, spacing: 12) {
					Text(honeymoon.place.uppercased())
						.foregroundColor(.white)
						.font(.largeTitle)
						.fontWeight(.bold)
						.shadow(radius: 1)
						.padding(.horizontal, 18)
						.padding(.vertical, 4)
						.overlay(alignment: .bottom, content: {
							Rectangle()
								.fill(Color.white)
								.frame(height: 1)
						})
					Text(honeymoon.country.uppercased())
						.foregroundColor(.black)
						.font(.footnote)
						.fontWeight(.bold)
						.frame(minWidth: 85)
						.padding(.horizontal, 10)
						.padding(.vertical, 5)
						.background(
						  Capsule().fill(Color.white)
						)
				}
				.frame(minWidth: 280)
				.padding(.bottom, 50)
			})
	}
}

struct CardView_Previews: PreviewProvider {
	static var previews: some View {
		CardView(honeymoon: honeymoonData[0])
	}
}
