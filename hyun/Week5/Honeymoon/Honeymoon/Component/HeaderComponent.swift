//
//  HeaderComponent.swift
//  Honeymoon
//
//  Created by 정현우 on 2023/07/29.
//

import SwiftUI

struct HeaderComponent: View {
	var body: some View {
		VStack(alignment: .center, spacing: 20) {
			Capsule()
				.frame(width: 120, height: 6)
				.foregroundColor(.secondary)
				.opacity(0.2)
			
			Image("logo-honeymoon")
				.resizable()
				.scaledToFit()
				.frame(height: 28)
		}
	}
}

struct HeaderComponent_Previews: PreviewProvider {
	static var previews: some View {
		HeaderComponent()
	}
}
