//
//  ContentView.swift
//  SwiftUIAsyncImage
//
//  Created by 정현우 on 2023/07/04.
//

import SwiftUI

extension Image {
	func imageModifier() -> some View {
		self
			.resizable()
			.scaledToFit()
	}
	
	func iconModifier() -> some View {
		self
			.imageModifier()
			.frame(maxWidth: 128)
			.foregroundColor(.purple)
			.opacity(0.5)
	}
}

struct ContentView: View {
	private let imageURL = "https://credo.academy/credo-academy@3x.png"
	
    var body: some View {
//		AsyncImage(url: URL(string: imageURL)) { image in
//			image.image
//		} placeholder: {
//			Image(systemName: "photo.circle.fill").iconModifier()
//
//		}
//		.padding(40)
		
		
//		AsyncImage(url: URL(string: imageURL)) { phase in
//			if let image = phase.image {
//				image.imageModifier()
//			} else if phase.error != nil {
//				// 에러
//				Image(systemName: "ant.circle.fill").iconModifier()
//			} else {
//				// placeholder(로딩중)
//				Image(systemName: "photo.circle.fill").iconModifier()
//			}
//		}
//		.padding(40)
		
		AsyncImage(
			url: URL(string: imageURL), transaction: Transaction(
				animation: .spring(
					response: 0.4,
					dampingFraction: 0.6,
					blendDuration: 0.25
				))) { phase in
					switch phase {
					case .success(let image):
						image
							.imageModifier()
//							.transition(.move(edge: .bottom))
//							.transition(.slide)
							.transition(.scale)
					case .failure(_):
						Image(systemName: "ant.circle.fill").iconModifier()
					case .empty:
						Image(systemName: "photo.circle.fill").iconModifier()
					@unknown default:
						ProgressView() // 로딩 인디케이터
					}
				}
			.padding(40)
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
