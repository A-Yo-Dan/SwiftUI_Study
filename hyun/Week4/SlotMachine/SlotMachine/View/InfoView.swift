//
//  InfoView.swift
//  SlotMachine
//
//  Created by 정현우 on 2023/07/25.
//

import SwiftUI

struct InfoView: View {
	@Environment(\.dismiss) var dismiss
	
    var body: some View {
		VStack(alignment: .center, spacing: 10) {
			LogoView()
			
			Spacer()
			
			Form {
				Section(content: {
					FormRowView(firstItem: "Application", secondItem: "Slot Machine")
					FormRowView(firstItem: "Platforms", secondItem: "iPhone, iPad, MAc")
					FormRowView(firstItem: "Developer", secondItem: "John / Jane")
					FormRowView(firstItem: "Designer", secondItem: "Robert Petras")
					FormRowView(firstItem: "Music", secondItem: "Dan Lebowitz")
					FormRowView(firstItem: "Website", secondItem: "https://credo.academy")
					FormRowView(firstItem: "Copyright", secondItem: "© All rights reserved.")
					FormRowView(firstItem: "Version", secondItem: "1.5.1")
				}, header: {
					Text("About the application")
				})
			}
			.font(.system(.body, design: .rounded))
		}
		.padding(.top, 40)
		.overlay(alignment: .topTrailing, content: {
			Button(action: {
				audioPlayer?.stop()
				self.dismiss()
			}, label: {
				Image(systemName: "xmark.circle")
					.font(.title)
			})
			.padding(.top, 30)
			.padding(.trailing, 20)
			.tint(.secondary)
		})
		.onAppear {
			playSound(sound: "background-music", type: "mp3")
		}
    }
}

struct FormRowView: View {
	var firstItem: String
	var secondItem: String
	
	var body: some View {
		HStack {
			Text(firstItem).foregroundColor(.gray)
			Spacer()
			Text(secondItem)
		}
	}
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}


