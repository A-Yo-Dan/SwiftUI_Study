//
//  LogoView.swift
//  SlotMachine
//
//  Created by 박민서 on 2023/07/12.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        Image("gfx-slot-machine")
            .resizable()
            .scaledToFit()
            .frame(minWidth: 256, idealWidth: 300, maxWidth: 320, minHeight: 112, idealHeight: 130, maxHeight: 140, alignment: .center)
            .padding(.horizontal)
            .layoutPriority(1) //이거 추가하면 이미지 부분 제외 다 짤림
            //?? 메인 ContentView에선 짤렸는데 LogoView로 갖고오니까 안짤려 뭐야
            .modifier(ShadowModifier())
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
