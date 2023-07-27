//
//  LogoView.swift
//  SlotMachine
//
//  Created by 정현우 on 2023/07/25.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
		Image("gfx-slot-machine")
			.resizable()
			.scaledToFit()
			.frame(minWidth: 256, idealWidth: 300, maxWidth: 320, minHeight: 112, idealHeight: 130, maxHeight: 140, alignment: .center)
			.padding(.horizontal)
			.layoutPriority(1)
			.shadowModifier()
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
