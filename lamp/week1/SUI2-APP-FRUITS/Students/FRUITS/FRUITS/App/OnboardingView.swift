//
//  OnboardingView.swift
//  FRUITS
//
//  Created by 박민서 on 2023/07/05.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTIES
    
    var fruits: [Fruit] = fruitsData
    // MARK: - BODY
    var body: some View {
        TabView {
            ForEach(fruits[0..<5]) { item in
                FruitCardView(fruit: item)
            } //: Loop
        } //: TAB
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(fruits: fruitsData)
    }
}
