//
//  CenterModifier.swift
//  Africa
//
//  Created by 이재혁 on 2023/08/01.
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
