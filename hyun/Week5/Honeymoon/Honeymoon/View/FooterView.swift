//
//  FooterView.swift
//  Honeymoon
//
//  Created by 정현우 on 2023/07/29.
//

import SwiftUI

struct FooterView: View {
	@Binding var showBookingAlert: Bool
	let haptics = UINotificationFeedbackGenerator()
	
	var body: some View {
		HStack {
			Image(systemName: "xmark.circle")
				.font(.system(size: 42, weight: .light))
			
			Spacer()
			
			Button(action: {
				playSound(sound: "sound-click", type: "mp3")
				self.haptics.notificationOccurred(.success)
				self.showBookingAlert.toggle()
			}, label: {
				Text("Book Destination".uppercased())
					.font(.system(.subheadline, design: .rounded))
					.fontWeight(.heavy)
					.padding(.horizontal, 20)
					.padding(.vertical, 12)
					.tint(.pink)
					.background(
						Capsule().stroke(Color.pink, lineWidth: 2)
					)
			})
			
			Spacer()
			
			Image(systemName: "heart.circle")
				.font(.system(size: 42, weight: .light))
		}
		.padding()
	}
}

struct FooterView_Previews: PreviewProvider {
	@State static var showAlert: Bool = false
	static var previews: some View {
		FooterView(showBookingAlert: $showAlert)
	}
}
