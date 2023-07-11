//
//  TitleView.swift
//  Touchdown
//
//  Created by 정현우 on 2023/07/10.
//

import SwiftUI

struct TitleView: View {
	// MARK: - Property
	var title: String
	
	// MARK: - Body
	var body: some View {
		HStack {
			Text(title)
				.font(.largeTitle)
				.fontWeight(.heavy)
			
			Spacer()
		}
		.padding(.horizontal)
		.padding(.top, 15)
		.padding(.bottom, 10)
	}
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "Helmet")
			.previewLayout(.sizeThatFits)
			.background(colorBackground)
    }
}
