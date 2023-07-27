//
//  Modifiers.swift
//  SlotMachine
//
//  Created by 정현우 on 2023/07/25.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.shadow(color: Color("ColorTransparentBlack"), radius: 0, x: 0, y: 6)
	}
}

struct ButtonModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.title)
			.tint(.white)
	}
}

struct ScoreNumberModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.shadow(color: Color("ColorTransparentBlack"), radius: 0, x: 0, y: 3)
			.layoutPriority(1)
	}
}

struct ScoreContainerModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.padding(.vertical, 4)
			.padding(.horizontal, 16)
			.frame(minWidth: 128)
			.background(
				Capsule()
					.foregroundColor(Color("ColorTransparentBlack"))
			)
	}
}

struct ImageModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.scaledToFit()
			.frame(minWidth: 140, idealWidth: 200, maxWidth: 220, minHeight: 130, idealHeight: 190, maxHeight: 200, alignment: .center)
			.shadowModifier()
	}
}

struct BetNumberModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.system(.title, design: .rounded))
			.padding(.vertical, 5)
			.frame(width: 90)
			.shadow(color: Color("ColorTransparentBlack"), radius: 0, x: 0, y: 3)
	}
}

struct BetCapsuleModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.background(
				Capsule()
					.fill(LinearGradient(colors: [Color("ColorPink"), Color("ColorPurple")], startPoint: .top, endPoint: .bottom))
			)
			.padding(3)
			.background(
				Capsule()
					.fill(LinearGradient(colors: [Color("ColorPink"), Color("ColorPurple")], startPoint: .bottom, endPoint: .top))
					.shadowModifier()
			)
	}
}

struct CasinoChipsModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.scaledToFit()
			.frame(height: 64)
			.shadowModifier()

	}
}

extension View {
	func shadowModifier() -> some View {
		modifier(ShadowModifier())
	}
	
	func buttonModifier() -> some View {
		modifier(ButtonModifier())
	}
	
	func scoreNumberModifier() -> some View {
		modifier(ScoreNumberModifier())
	}
	
	func scoreContainerModifier() -> some View {
		modifier(ScoreContainerModifier())
	}
	
	func imageModifier() -> some View {
		modifier(ImageModifier())
	}
	
	func betNumberModifier() -> some View {
		modifier(BetNumberModifier())
	}
	
	func betCapsuleModifier() -> some View {
		modifier(BetCapsuleModifier())
	}
	
	func casinoChipsModifier() -> some View {
		modifier(CasinoChipsModifier())
	}
}

extension Text {
	func scoreLabelStyle() -> Text {
		self
			.foregroundColor(.white)
			.font(.system(size: 10, weight: .bold, design: .rounded))
	}
	
	func scoreNumberStyle() -> Text {
		self
			.foregroundColor(.white)
			.font(.system(.title, design: .rounded))
			.fontWeight(.heavy)
	}
}
