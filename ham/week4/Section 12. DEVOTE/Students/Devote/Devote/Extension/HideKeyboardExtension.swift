//
//  HideKeyboardExtension.swift
//  Devote
//
//  Created by 이재혁 on 2023/07/26.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
