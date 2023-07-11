//
//  FooterView.swift
//  Touchdown
//
//  Created by 정현우 on 2023/07/09.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
		VStack(alignment: .center, spacing: 10) {
			Text("We offer the most cutting edge, comfortable, lightweight and durable football helmets in the market at affordable prices.")
				.foregroundColor(.gray)
				.multilineTextAlignment(.center)
				.layoutPriority(2)
			
			Image("logo-lineal")
				.renderingMode(.template)
				.foregroundColor(.gray)
				.layoutPriority(0)
			
			Text("Copyright © Robert Petras\nAll right reserved")
				.font(.footnote)
				.fontWeight(.bold)
				.foregroundColor(.gray)
				.multilineTextAlignment(.center)
				.layoutPriority(1)
		} //: VStack
		.padding()
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
			.previewLayout(.sizeThatFits)
			.background(colorBackground)
    }
}
