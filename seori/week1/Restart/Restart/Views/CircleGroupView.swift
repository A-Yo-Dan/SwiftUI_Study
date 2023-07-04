//
//  CircleGroupView.swift
//  Restart
//
//  Created by 서은수 on 2023/07/04.
//

import SwiftUI

// Reusable component
struct CircleGroupView: View {
    // MARK: - PROPERTY
    
    /// @State = A property wrapper type that can read and write a value managed by SwiftUI
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    @State private var isAnimating: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        } //: ZSTACK
        .blur(radius: isAnimating ? 0 : 10) // 블러가 있다가 없어진다
        .opacity(isAnimating ? 1 : 0) // 투명하다가 불투명해진다
        .scaleEffect(isAnimating ? 1 : 0.5) // 작았다가 커진다
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear(perform: { // 이 뷰가 보이면 클로저의 코드를 실행
            isAnimating = true
        })
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    // MARK: - PREVIEW
    // 프리뷰에 어떻게 보이게 할지
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all) // SafeArea 영역 무시하고 다 채우겠다
            CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2) // 필요한 값 넣어줌
        }
    }
}
