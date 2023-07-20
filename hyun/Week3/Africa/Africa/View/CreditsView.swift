//
//  CreditsView.swift
//  Africa
//
//  Created by 정현우 on 2023/07/17.
//

import SwiftUI

struct CreditsView: View {
	var body: some View {
		VStack {
			Image("compass")
				.resizable()
				.scaledToFit()
				.frame(width: 128, height: 128)
			
			Text("""
   Copyright © Robert Petras
   All right reserved
   Better Apps ♡ Less Code
   """)
			.font(.footnote)
			.multilineTextAlignment(.center)
		} //: VStack
		.padding()
		.opacity(0.4)
	}
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
