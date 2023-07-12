//
//  HideKeyboardExtension.swift
//  Devote
//
//  Created by 정현우 on 2023/07/11.
//

import SwiftUI

#if canImport(UIKit)
extension View {
	func hideKeyboard() {
		UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
	}
}
#endif
