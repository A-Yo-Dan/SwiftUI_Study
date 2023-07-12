//
//  TitleModifier.swift
//  Honeymoon
//
//  Created by 이재혁 on 2023/07/12.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(Color.pink)
    }
}


