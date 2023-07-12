//
//  BackgroundImageView.swift
//  Devote
//
//  Created by 정현우 on 2023/07/12.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        Image("rocket")
			.antialiased(true)
			.resizable()
			.scaledToFill()
			.ignoresSafeArea(.all)
    }
}

struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
    }
}
