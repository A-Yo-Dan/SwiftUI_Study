//
//  ReelView.swift
//  SlotMachine
//
//  Created by 정현우 on 2023/07/25.
//

import SwiftUI

struct ReelView: View {
    var body: some View {
        Image("gfx-reel")
			.resizable()
			.imageModifier()
			
    }
}

struct ReelView_Previews: PreviewProvider {
    static var previews: some View {
        ReelView()
			.previewLayout(.sizeThatFits)
			.padding()
    }
}
