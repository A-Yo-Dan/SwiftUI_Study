//
//  FooterView.swift
//  Touchdown
//
//  Created by 서은수 on 2023/08/07.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("dklfjewilfjlkwejfklewjklfjdsklfjkldsjfdklsfjklsdfjsklfjklsdfjlskfsfsdkfjksdfjlksdjflksjfklsfjlksjflksfjlsfjlskfsjflsfsldfjlsfjlsfjlsjf.")
                .foregroundStyle(Color.gray)
                .multilineTextAlignment(.center)
                .layoutPriority(2) // 값이 클수록 우선순위가 높아서 길어질 때는 가장 빨리 길어지고 줄어들 때는 가장 늦게 줄어들게 된다.
            
            Image("logo-lineal")
                .renderingMode(.template)
                .foregroundStyle(.gray)
                .layoutPriority(0)
            
            Text("Copyright © Seori\nAll right reserved")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .layoutPriority(1)
        }
        .padding()
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
            .previewLayout(.sizeThatFits)
            .background(colorBackground)
    }
}
