//
//  RipeningStagesView.swift
//  Avocados
//
//  Created by 정현우 on 2023/07/28.
//

import SwiftUI

struct RipeningStagesView: View {
	
	var ripeningStages: [Ripening] = ripeningData
	
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			VStack {
				Spacer()
				HStack(alignment: .center, spacing: 25) {
					ForEach(ripeningStages) { stage in
						RipeningView(ripening: stage)
					}
				}
				.padding(.vertical)
				.padding(.horizontal, 25)
				Spacer()
			}
		}
		.edgesIgnoringSafeArea(.all)
	}
}

struct RipeningStagesView_Previews: PreviewProvider {
	static var previews: some View {
		RipeningStagesView()
	}
}
