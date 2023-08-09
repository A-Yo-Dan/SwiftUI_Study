//
//  ContentView.swift
//  Learn by Doing
//
//  Created by 정현우 on 2023/08/03.
//

import SwiftUI

struct ContentView: View {
	var card: [Card] = cardData
    var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack(alignment: .center, spacing: 20) {
				ForEach(card) { card in
					CardView(card: card)
				}
			}
			.padding(20)
		}
		
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
