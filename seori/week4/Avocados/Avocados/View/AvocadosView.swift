//
//  AvocadosView.swift
//  Avocados
//
//  Created by 서은수 on 2023/07/22.
//

import SwiftUI

struct AvocadosView: View {
    
    // MARK: - Properties
    
    @State private var pulsateAnimation: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Spacer()
            Image("avocado")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 240, height: 240, alignment: .center)
                .shadow(color: Color("ColorBlackTransparentDark"), radius: 12, x: 0, y: 8)
                .scaleEffect(self.pulsateAnimation ? 1 : 0.9)
                .opacity(self.pulsateAnimation ? 1 : 0.9)
                .animation(
                    .easeInOut(duration: 1.5).repeatForever(autoreverses: true),
                    value: self.pulsateAnimation
                )
            
            VStack {
                Text("Avocados".uppercased())
                    .font(.system(size: 42, weight: .bold, design: .serif))
                    .foregroundColor(.white)
                    .padding()
                    .shadow(color: Color("ColorBlackTransparentBlack"), radius: 4, x: 0, y: 4)
                Text("""
Creamy, green, and full of nutrients!
Avocado is a powerhouse ingredient at any meal. Enjoy these handpicked avocado recipes for breakfast, lunch, dinner & more!
""")
                .lineLimit(nil)
                .font(.system(.headline, design: .serif))
                .foregroundColor(Color("ColorGreenLight"))
                .multilineTextAlignment(.center)
                .lineSpacing(8)
                .frame(maxWidth: 640, minHeight: 120)
            }
            .padding()
            
            Spacer()
        }
        .background(
            Image("background-home")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .edgesIgnoringSafeArea(.all) // Safe Area 무시 -> background로 설정한 사진이 영역을 넘어서 확장된다
        .onAppear { // 보이면
            self.pulsateAnimation.toggle() // tf 토글
        }
    }
}

// MARK: - Preview

struct AvocadosView_Previews: PreviewProvider {
    static var previews: some View {
        AvocadosView()
            .previewDevice("iPhone 11 Pro")
//            .environment(\.colorScheme, .dark)
    }
}
