//
//  StartButtonView.swift
//  Fruits
//
//  Created by 정현우 on 2023/07/05.
//

import SwiftUI

struct StartButtonView: View {
	// MARK: - Properties
	@AppStorage("isOnboarding") var isOnboarding: Bool?
	
	// MARK: - Body
    var body: some View {
        Button(action: {
			isOnboarding = false
		}, label: {
			HStack(spacing: 8) {
				Text("Start")
				
				Image(systemName: "arrow.right.circle")
					.imageScale(.large)
			}
			.padding(.horizontal, 16)
			.padding(.vertical, 10)
			.background(
				Capsule()
					.stroke(.white, lineWidth: 1.25)
			)
		})
		.tint(.white)
    }
}

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
			.previewLayout(.sizeThatFits)
    }
}
