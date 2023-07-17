//
//  CenterModifier.swift
//  Africa
//
//  Created by 정현우 on 2023/07/17.
//

import SwiftUI

struct CenterModifier: ViewModifier {
	func body(content: Content) -> some View {
		HStack {
			Spacer()
			content
			Spacer()
		}
	}
}
