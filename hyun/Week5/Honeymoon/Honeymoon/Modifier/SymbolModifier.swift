//
//  SymbolModifier.swift
//  Honeymoon
//
//  Created by 정현우 on 2023/07/30.
//

import SwiftUI

struct SymbolModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.foregroundColor(.white)
			.font(.system(size: 128))
			.shadow(color: .black.opacity(0.2), radius: 12, x: 0, y: 0)
	}
    
}

