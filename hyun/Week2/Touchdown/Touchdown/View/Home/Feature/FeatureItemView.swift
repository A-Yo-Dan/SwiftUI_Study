//
//  FeatureItemView.swift
//  Touchdown
//
//  Created by 정현우 on 2023/07/09.
//

import SwiftUI

struct FeatureItemView: View {
	// MARK: - Property
	let player: Player
	
	// MARK: - Body
    var body: some View {
		Image(player.image)
			.resizable()
			.scaledToFit()
			.cornerRadius(12)
    }
}

struct FeatureItemView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureItemView(player: players[0])
			.previewLayout(.sizeThatFits)
			.padding()
			.background(colorBackground)
    }
}
