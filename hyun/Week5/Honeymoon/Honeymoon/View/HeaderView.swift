//
//  HeaderView.swift
//  Honeymoon
//
//  Created by 정현우 on 2023/07/29.
//

import SwiftUI

struct HeaderView: View {
	@Binding var showGuideView: Bool
	@Binding var showInfoView: Bool
	let haptics = UINotificationFeedbackGenerator()
	
    var body: some View {
		HStack {
			Button(action: {
				playSound(sound: "sound-click", type: "mp3")
				haptics.notificationOccurred(.success)
				self.showInfoView.toggle()
			}, label: {
				Image(systemName: "info.circle")
					.font(.system(size: 24, weight: .regular))
			})
			.tint(.primary)
			.sheet(isPresented: $showInfoView, content: {
				InfoView()
			})
			
			Spacer()
			
			Image("logo-honeymoon-pink")
				.resizable()
				.scaledToFit()
				.frame(height: 28)
			
			Spacer()
			
			Button(action: {
				playSound(sound: "sound-click", type: "mp3")
				haptics.notificationOccurred(.success)
				self.showGuideView.toggle()
			}, label: {
				Image(systemName: "questionmark.circle")
					.font(.system(size: 24, weight: .regular))
			})
			.tint(.primary)
			.sheet(isPresented: $showGuideView, content: {
				GuideView()
			})
		}
		.padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
	@State static var showGuide: Bool = false
	@State static var showInfo: Bool = false
	
    static var previews: some View {
        HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
    }
}
