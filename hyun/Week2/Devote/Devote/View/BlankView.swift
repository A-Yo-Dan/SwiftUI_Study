//
//  BlankView.swift
//  Devote
//
//  Created by 정현우 on 2023/07/12.
//

import SwiftUI

struct BlankView: View {
	var backgroundColor: Color
	var backgroundOpacity: Double
	
    var body: some View {
		VStack {
			Spacer()
			
		}
		.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
		.background(backgroundColor)
		.opacity(backgroundOpacity)
		.blendMode(.overlay)
		.ignoresSafeArea(.all)
    }
}

struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
		BlankView(backgroundColor: .black, backgroundOpacity: 0.3)
			.background(BackgroundImageView())
			.background(backgroundGradient)
    }
}
