//
//  OnboardingView.swift
//  Fruits
//
//  Created by 정현우 on 2023/07/05.
//

import SwiftUI

struct OnboardingView: View {
	// MARK: - Properties
	var fruits: [Fruit] = fruitsData
	
	// MARK: - Body
    var body: some View {
		TabView {
			ForEach(fruits[0...5]) { item in
				FruitCardView(fruit: item)
			}

		}  //: TabView
		.tabViewStyle(.page)
		.padding(.vertical, 20)
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(fruits: fruitsData)
    }
}
