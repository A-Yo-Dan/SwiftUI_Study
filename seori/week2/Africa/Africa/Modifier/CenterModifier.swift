//
//  CenterModifier.swift
//  Africa
//
//  Created by 서은수 on 2023/07/12.
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
