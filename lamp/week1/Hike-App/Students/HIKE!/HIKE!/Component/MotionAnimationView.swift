//
//  MotionAnimationView.swift
//  HIKE!
//
//  Created by 박민서 on 2023/07/05.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: - PROPERTIES
    
    @State private var randomCircle: Int = Int.random(in: 6...12)
    @State private var isAnimating: Bool = false
    //MARK: - FUNCTIONS
    
    // 1. random coordinate
    // declaring a precise position of any view in swift UI, then we must use CGFloat
    func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    // 2. random size
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 4...80))
    }
    // 3. random scale
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    // 4. random speed
    func randomSpeed() -> Double {
        return Double.random(in: 0.05...1.0)
    }
    // 5. random delay
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    var body: some View {
        ZStack {
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(x:randomCoordinate(), y:randomCoordinate())
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear(perform: {
                        withAnimation (
                            .interpolatingSpring(stiffness: 0.25, damping: 0.5)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ) {
                            isAnimating = true
                        }
                    })
            }
        } //: ZStack
        .frame(width: 256, height: 256)
        // we must relocate the frame modifier to highest stack
        .mask(Circle())
        // This new modifier applies an alpha channel with a circle shape to the zstack
        .drawingGroup() // this is for High-Performance Rendering
        // powered by Apple's Metal Framework, which  Direct Connection to GPU
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
            .background(
                Circle()
                    .fill(.teal)
            )
    }
}
