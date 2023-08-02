//
//  CardTransition.swift
//  Honeymoon
//
//  Created by 정현우 on 2023/07/30.
//

import SwiftUI

extension AnyTransition {
	static var trailingBottom: AnyTransition {
		AnyTransition.asymmetric(insertion: .identity, removal: AnyTransition.move(edge: .trailing).combined(with: .move(edge: .bottom)))
	}
	
	static var leadingBottom: AnyTransition {
		AnyTransition.asymmetric(insertion: .identity, removal: AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom)))
	}
	
	
}
