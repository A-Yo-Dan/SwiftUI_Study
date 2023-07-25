//
//  ContentView.swift
//  Developers
//
//  Created by 박민서 on 2023/07/25.
//

import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTIES
  
  var cards: [Card] = cardData
  
  // MARK: - CONTENT
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .center, spacing: 20) {
        ForEach(cards) { item in
          CardView(card: item)
        }
      }
      .padding(20)
    }
  }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
