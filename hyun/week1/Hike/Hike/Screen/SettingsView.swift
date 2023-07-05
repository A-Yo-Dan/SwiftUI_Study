//
//  SettingsView.swift
//  Hike
//
//  Created by 정현우 on 2023/07/05.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
		List {
			// MARK: - Section: Header
			Section{
				HStack {
					Spacer()
					
					Image(systemName: "laurel.leading")
						.font(.system(size: 80, weight: .black))
					
					VStack(spacing: -10) {
						Text("Hike")
							.font(.system(size: 66, weight: .black))
						
						Text("Editors' Choice")
							.fontWeight(.medium)
					}
					
					Image(systemName: "laurel.trailing")
						.font(.system(size: 80, weight: .black))
					
					Spacer()
				}
				.foregroundStyle(
					LinearGradient(
						colors: [.customGreenLight, .customGreenMedium, .customGreenDark],
						startPoint: .top,
						endPoint: .bottom)
				)
				.padding(.top, 8)
				
				VStack(spacing: 8) {
					Text("Where can you find \nperfect tracks?")
						.font(.title2)
						.fontWeight(.heavy)
					
					Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app")
						.font(.footnote)
						.italic()
					
					Text("Dust off the boots! It's time for a walk.")
						.fontWeight(.heavy)
						.foregroundColor(.customGreenMedium)
				}
				.multilineTextAlignment(.center)
				.padding(.bottom, 16)
				.frame(maxWidth: .infinity)
				
				
			} //: Section1
			.listRowSeparator(.hidden)
			
			// MARK: - Section: Icons
			
			// MARK: - Section: About
			Section(content: {
				CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)
				CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS, iPadOS", rowTintColor: .red)
				CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
				CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
				CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Hyunwoo", rowTintColor: .mint)
				CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Robert", rowTintColor: .pink)
				CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowContent: "google.com", rowTintColor: .indigo)
				CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "Google", rowLinkDestination: "https://google.com")
				
			}, header: {
				Text("ABOUT THE APP")
			}, footer: {
				HStack {
					Spacer()
					Text("Copuright © All right reserved")
					Spacer()
				}
				.padding(.vertical, 8)
			}) //: Section
			
		} //: List
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
