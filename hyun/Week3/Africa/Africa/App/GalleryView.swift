//
//  GalleryView.swift
//  Africa
//
//  Created by 정현우 on 2023/07/15.
//

import SwiftUI

struct GalleryView: View {
	// MARK: - Property
//	let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
	@State private var gridLayout: [GridItem] = [GridItem(.flexible())]
	@State private var gridColumn: Double = 3.0
	@State private var selectedAnimal: String = "lion"
	let animals: [Animal] = Bundle.main.decode("animals.json")
	let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
	
	// MARK: - Function
	func gridSwitch() {
		gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
	}
	
	// MARK: - Body
    var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			VStack(alignment: .center, spacing: 30) {
				Image(selectedAnimal)
					.resizable()
					.scaledToFit()
					.clipShape(Circle())
					.overlay(
						Circle()
							.stroke(Color.white, lineWidth: 8)
					)
				
				Slider(value: $gridColumn, in: 2...4, step: 1)
					.padding(.horizontal)
					.onChange(of: gridColumn, perform: { value in
						withAnimation(.easeIn(duration: 0.5)) {
							gridSwitch()
						}
					})

				LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
					ForEach(animals) { item in
						Image(item.image)
							.resizable()
							.scaledToFit()
							.clipShape(Circle())
							.overlay(
								Circle()
									.stroke(Color.white, lineWidth: 1)
							)
							.onTapGesture {
								selectedAnimal = item.image
								hapticImpact.impactOccurred()
							}
					}
				} //: LazyVGrid
				.onAppear {
					gridSwitch()
					
				}
			} //: VStack
			.padding(.horizontal, 10)
			.padding(.vertical, 50)
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(MotionAnimationView())
    }
}

// MARK: - Preview
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
