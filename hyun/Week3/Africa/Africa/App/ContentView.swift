//
//  ContentView.swift
//  Africa
//
//  Created by 정현우 on 2023/07/15.
//

import SwiftUI

struct ContentView: View {
	// MARK: - Property
	let animals: [Animal] = Bundle.main.decode("animals.json")
	let haptics = UIImpactFeedbackGenerator(style: .medium)
	@State private var isGridViewActive: Bool = false
	
	@State private var gridLayout: [GridItem] = [GridItem(.flexible())]
	@State private var gridColumn: Int = 1
	@State private var toolbarIcon: String = "square.grid.2x2"
	
	// MARK: - Function
	func gridSwitch() {
		gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
		gridColumn = gridLayout.count
		
		switch gridColumn {
		case 1:
			toolbarIcon = "square.grid.2x2"
		case 2:
			toolbarIcon = "square.grid.3x2"
		case 3:
			toolbarIcon = "rectangle.grid.1x2"
		default:
			toolbarIcon = "square.grid.2x2"
		}
	}
	
	// MARK: - Body
    var body: some View {
		NavigationView {
			Group {
				if !isGridViewActive {
					List {
						CoverImageView()
							.frame(height: 300)
							.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
						
						ForEach(animals) { animal in
							NavigationLink(destination: AnimalDetailView(animal: animal)) {
								AnimalListItemView(animal: animal)
							}
							
						}
						CreditsView()
							.modifier(CenterModifier())
					}  //: List
					.listStyle(.plain)
				} else {
					ScrollView(.vertical, showsIndicators: false) {
						LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
							ForEach(animals) { animal in
								NavigationLink(destination: AnimalDetailView(animal: animal), label: {
									AnimalGridItemView(animal: animal)
								})
							}
						}
						.padding()
					}
				}
			}
			.navigationTitle("Africa")
			.navigationBarTitleDisplayMode(.large)
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing, content: {
					HStack(spacing: 16) {
						Button(action: {
							isGridViewActive = false
							haptics.impactOccurred()
						}, label: {
							Image(systemName: "square.fill.text.grid.1x2")
								.font(.title2)
								.foregroundColor(isGridViewActive ? .primary : .accentColor)
						})
						
						Button(action: {
							isGridViewActive = true
							haptics.impactOccurred()
							gridSwitch()
						}, label: {
							Image(systemName: toolbarIcon)
								.font(.title2)
								.foregroundColor(isGridViewActive ? .accentColor : .primary)
						})
					}
				})
			}
		} //: NavigationView
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
