//
//  ContentView.swift
//  Fruits
//
//  Created by 정현우 on 2023/07/05.
//

import SwiftUI

struct ContentView: View {
	// MARK: - Properties
	var fruits: [Fruit] = fruitsData
	@State private var isShowingSettings: Bool = false
	
	// MARK: - Body
    var body: some View {
		NavigationView {
			List {
				ForEach(fruits.shuffled()) { fruit in
					NavigationLink(destination: {
						FruitDetailView(fruit: fruit)
					}, label: {
						FruitRowView(fruit: fruit)
							.padding(.vertical, 4)
					})
					
				}
			} //: List
			.listStyle(.plain)
			.navigationTitle("Fruits")
			.navigationBarItems(trailing: Button(action: {
				isShowingSettings = true
			}, label: {
				Image(systemName: "slider.horizontal.3")
			}))
			.sheet(isPresented: $isShowingSettings) {
				SettingsView()
			}
		} //: NavigationView
		.navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
    }
}
