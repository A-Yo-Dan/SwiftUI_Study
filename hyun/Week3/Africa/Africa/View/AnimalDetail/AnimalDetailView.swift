//
//  AnimalDetailView.swift
//  Africa
//
//  Created by 정현우 on 2023/07/16.
//

import SwiftUI

struct AnimalDetailView: View {
	// MARK: - Property
	let animal: Animal
	
	// MARK: - Body
    var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			VStack(alignment: .center, spacing: 20) {
				Image(animal.image)
					.resizable()
					.scaledToFit()
				
				Text(animal.name.uppercased())
					.font(.largeTitle)
					.fontWeight(.heavy)
					.multilineTextAlignment(.center)
					.padding(.vertical, 8)
					.foregroundColor(.primary)
					.background(
						Color.accentColor
							.frame(height: 6)
							.offset(y: 24)
					)
				
				Text(animal.headline)
					.font(.headline)
					.multilineTextAlignment(.leading)
					.foregroundColor(.accentColor)
					.padding(.horizontal)
				
				Group {
					HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
					InsetGalleryView(animal: animal)
				}
				.padding(.horizontal)
				
				Group {
					HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
					InsetFactView(animal: animal)
				}
				.padding(.horizontal)
				
				Group {
					HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
					Text(animal.description)
						.multilineTextAlignment(.leading)
						.layoutPriority(1)
				}
				.padding(.horizontal)
				
				Group {
					HeadingView(headingImage: "map", headingText: "National Parks")
					InsetMapView()
				}
				.padding(.horizontal)
				
				Group {
					HeadingView(headingImage: "books.vertical", headingText: "Learn More")
					ExternalWeblinkView(animal: animal)
				}
				.padding(.horizontal)
				
				
			} //: VStack
			.navigationTitle("Lern about \(animal.name)")
			.navigationBarTitleDisplayMode(.inline)
		} //: Scrollview
    }
}

// MARK: - Preview
struct AnimalDetailView_Previews: PreviewProvider {
	static let animals: [Animal] = Bundle.main.decode("animals.json")
	
    static var previews: some View {
		NavigationView {
			AnimalDetailView(animal: animals[0])
		}
    }
}
