//
//  CenterModifier.swift
//
//  Created by YOUJIM on 2023/07/26.
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
