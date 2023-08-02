//
//  ButtonModifier.swift
//  Honeymoon
//
//  Created by 정현우 on 2023/07/30.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.headline)
			.padding()
			.frame(minWidth: 0, maxWidth: .infinity)
			.background(
				Capsule()
					.fill(Color.pink)
			)
			.foregroundColor(.white)
	}
}
