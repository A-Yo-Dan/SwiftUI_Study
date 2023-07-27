//
//  CreditsView.swift
//  Notes Watch App
//
//  Created by 정현우 on 2023/07/24.
//

import SwiftUI

struct CreditsView: View {
	@State private var randomNumber: Int = Int.random(in: 1..<4)
	private var randomImage: String {
		return "developer-no\(randomNumber)"
	}
	
    var body: some View {
		VStack(spacing: 3) {
			Image(randomImage)
				.resizable()
				.scaledToFit()
				.layoutPriority(1)
			
			HeaderView(title: "Credits")
			
			Text("정현우")
				.foregroundColor(.primary)
				.fontWeight(.bold)
			Text("개발자")
				.font(.footnote)
				.fontWeight(.light)
		}
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
