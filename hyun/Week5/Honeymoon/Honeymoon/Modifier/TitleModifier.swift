//
//  TitleModifier.swift
//  Honeymoon
//
//  Created by 정현우 on 2023/07/30.
//

import SwiftUI

struct TitleModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.largeTitle)
			.foregroundColor(.pink)
	}
}
