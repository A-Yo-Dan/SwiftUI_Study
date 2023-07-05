//
//  MotionAnimationView.swift
//  Hike
//
//  Created by 정현우 on 2023/07/04.
//

import SwiftUI

struct MotionAnimationView: View {
	// MARK: - Properties
	@State private var randomCircle: Int = Int.random(in: 6...12)
	@State private var isAnimating: Bool = false
	
	// MARK: - Functions
	func randomCoordinate() -> CGFloat {
		return CGFloat.random(in: 0...256)
	}
	
	func randomSize() -> CGFloat {
		return CGFloat(Int.random(in: 4...80))
	}
	
	func randomScale() -> CGFloat {
		return CGFloat(Double.random(in: 0.1...2.0))
	}
	
	func randomSpeed() -> Double {
		return Double.random(in: 0.05...1.0)
	}
	
	func randomDelay() -> Double {
		return Double.random(in: 0...2)
	}
	
    var body: some View {
		ZStack {
			ForEach(0...randomCircle, id: \.self) { item in
				Circle()
					.foregroundColor(.white)
					.opacity(0.25)
					.frame(width: randomSize(), height: randomSize())
					.position(x: randomCoordinate(), y: randomCoordinate())
					.scaleEffect(isAnimating ? randomScale() : 1)
					.onAppear {
						withAnimation(
							.interpolatingSpring(stiffness: 0.25, damping: 0.25)
							.repeatForever()
							.speed(randomSpeed())
							.delay(randomDelay())
						) {
							isAnimating = true
						}
					}
			}
		}
		.frame(width: 256, height: 256)
		.mask(Circle())  // 밖으로 벗어나지 않게
		.drawingGroup()  // Metal로 GPU작업. 복잡한 그래픽 작업에 사용
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
