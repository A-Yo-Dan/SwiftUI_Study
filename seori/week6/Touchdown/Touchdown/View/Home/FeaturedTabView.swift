//
//  FeaturedTabView.swift
//  Touchdown
//
//  Created by 서은수 on 2023/08/07.
//

import SwiftUI

struct FeaturedTabView: View {
    var body: some View {
        TabView {
            ForEach(players) { player in
                FeatureItemView(player: player)
                    .padding(.horizontal, 15)
                    .padding(.top, 10)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

struct FeaturedTabView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedTabView()
            .previewDevice("iPhone 12 Pro")
            .background(.gray)
    }
}
