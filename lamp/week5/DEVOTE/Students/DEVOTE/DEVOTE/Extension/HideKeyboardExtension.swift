//
//  HideKeyboardExtension.swift
//  DEVOTE
//
//  Created by 박민서 on 2023/08/02.
//

import SwiftUI

#if canImport(UIKit)
extension View {
  func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
#endif
