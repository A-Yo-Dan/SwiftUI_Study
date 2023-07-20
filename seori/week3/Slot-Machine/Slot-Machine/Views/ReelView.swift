//
//  ReelView.swift
//  Slot-Machine
//
//  Created by 서은수 on 2023/07/17.
//

import SwiftUI

// 메인 화면에 3개의 Reel이 필요
struct ReelView: View {
    var body: some View {
        Image("gfx-reel")
            .resizable()
            .modifier(ImageModifier())
    }
}

struct ReelView_Previews: PreviewProvider {
    static var previews: some View {
        ReelView()
    }
}
