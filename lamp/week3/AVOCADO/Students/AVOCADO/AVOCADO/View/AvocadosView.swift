//
//  AvocadosView.swift
//  AVOCADO
//
//  Created by 박민서 on 2023/07/17.
//

import SwiftUI

struct AvocadosView: View {
    // MARK: - PROPERTIES
    
    @State private var pulsateAnimation: Bool = false
    
    
    var body: some View {
        VStack {
            Spacer()
            Image("avocado")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 240, height: 240,alignment: .center)
                .shadow(color: Color("ColorBlackTransparentDark"), radius: 12)
                .scaleEffect(self.pulsateAnimation ? 1 : 0.9)
                .opacity(self.pulsateAnimation ? 1 : 0.9)
                .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: self.pulsateAnimation)
            VStack {
                Text("Avocados".uppercased())
                    .font(.system(size: 42, weight: .bold, design: .serif))
                    .foregroundColor(Color.white)
                    .padding()
                .shadow(color: Color("ColorBlackTransparentDark"), radius: 4)
                Text("""
                     Creamy, green, and full of nutrients! Avocado is a powerhouse ingredient at any meal. Enjoy these handpicked avocado recipes for breakfast, lunch, dinner & more!
                     """)
                .lineLimit(nil)
                .font(.system(.headline, design: .serif))
                .foregroundColor(Color("ColorGreenLight"))
                .multilineTextAlignment(.center)
                .lineSpacing(8)
                .frame(maxWidth: 640, minHeight: 120) //스유에서는 강의 기준으로 최소 높이가 있어야 multilineString에 문제가 안생김 -> 문제가 안생길까 이제?
            }
            
            Spacer()
        }
        .background(
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .edgesIgnoringSafeArea(.all)
        .onAppear(perform: {
            self.pulsateAnimation.toggle()
        })
    }
}

struct AvocadosView_Previews: PreviewProvider {
    static var previews: some View {
        AvocadosView()
            .previewDevice("iPhone 11 Pro")
            .environment(\.colorScheme, .dark)
    }
}
