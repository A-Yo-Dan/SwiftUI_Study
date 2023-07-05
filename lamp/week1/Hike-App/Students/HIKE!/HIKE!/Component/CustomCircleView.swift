//
//  CustomCircleView.swift
//  HIKE!
//
//  Created by 박민서 on 2023/07/05.
//

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimateGradient: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            .customIndigoMedium,
                            .customSalmonLight
                        ],
                        startPoint: isAnimateGradient ? .topLeading : .topTrailing,
                        endPoint: isAnimateGradient ? .topTrailing : .bottomLeading
                    )
                )
                .onAppear {
                    withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                        isAnimateGradient.toggle()
                    }
                }
            MotionAnimationView()
        }//: ZSTACK
        .frame(width: 256, height: 256)
        // we must relocate the frame modifier to highest stack
    }
}

struct CustomCircleView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCircleView()
            //.preferredColorScheme(.dark)
    }
}
