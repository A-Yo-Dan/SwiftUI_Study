//
//  FeatureTabView.swift
//  Touchdown
//
//  Created by 정현우 on 2023/07/09.
//

import SwiftUI

struct FeatureTabView: View {
    var body: some View {
		TabView {
			ForEach(players) { player in
				FeatureItemView(player: player)
					.padding(.top, 10)
					.padding(.horizontal, 15)
			}
		}
		.tabViewStyle(.page(indexDisplayMode: .always))
    }
}

struct FeatureTabView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureTabView()
			.background(.gray)
    }
}
