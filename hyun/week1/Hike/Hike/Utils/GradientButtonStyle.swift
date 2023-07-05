//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by 정현우 on 2023/07/04.
//

import SwiftUI

struct GradientButton: ButtonStyle {
	func makeBody(configuration: Configuration) -> some View {
		configuration
			.label
			.padding(.vertical)
			.padding(.horizontal, 30)
			.background(
				configuration.isPressed ?
				LinearGradient(
					colors: [.customGrayLight, .customGrayMedium],
					startPoint: .top,
					endPoint: .bottom)
				:
					LinearGradient(
						colors: [.customGrayMedium, .customGrayLight],
						startPoint: .top,
						endPoint: .bottom)
			)
			.cornerRadius(40)
	}
}
