//
//  SettingsView.swift
//  Todo App
//
//  Created by 정현우 on 2023/08/03.
//

import SwiftUI

struct SettingsView: View {
	
	@Environment(\.dismiss) var dismiss
	@EnvironmentObject var iconSettings: IconNames
	
	let themes: [Theme] = themeData
	@ObservedObject var theme = ThemeSettings()
	@State private var isThemeChanged: Bool = false
	
	var body: some View {
		NavigationView {
			VStack(alignment: .center, spacing: 0) {
				// MARK: - Form
				Form {
					
					// MARK: - Section 1
					Section(content: {
						Picker(selection: $iconSettings.currentIndex, content: {
							ForEach(0..<iconSettings.iconNames.count) { index in
								HStack {
									Image(uiImage: UIImage(named: self.iconSettings.iconNames[index] ?? "Blue") ?? UIImage())
										.renderingMode(.original)
										.resizable()
										.scaledToFit()
										.frame(width: 44, height: 44)
										.cornerRadius(8)
									
									Spacer()
										.frame(width: 8)
									
									Text(self.iconSettings.iconNames[index] ?? "Blue")
										.frame(alignment: .leading)
								}
								.padding(3)
								
							}
						}, label: {
							HStack {
								ZStack {
									RoundedRectangle(cornerRadius: 8, style: .continuous)
										.strokeBorder(Color.primary, lineWidth: 2)
									
									Image(systemName: "paintbrush")
										.font(.system(size: 28, weight: .regular, design: .default))
										.foregroundColor(.primary)
								}
								.frame(width: 44, height: 44)
								
								Text("App Icons".uppercased())
									.fontWeight(.bold)
									.foregroundColor(.primary)
							}
							
						})
						.pickerStyle(.navigationLink)
						.onReceive([self.iconSettings.currentIndex].publisher.first()) { (value) in
							let index = self.iconSettings.iconNames.firstIndex(of: UIApplication.shared.alternateIconName) ?? 0
							if index != value {
								UIApplication.shared.setAlternateIconName(self.iconSettings.iconNames[value]) { error in
									if let error = error {
										print(error.localizedDescription)
									} else {
										print("Success! You have changed the app icon.")
									}
								}
							}
						}
						
					}, header: {
						Text("Choose the app icon")
					})
					.padding(.vertical, 3)
					
					// MARK: - Section 2
					Section(content: {
						List {
							ForEach(themes, id: \.id) { theme in
								
								Button(action: {
									self.theme.themeSettings = theme.id
									UserDefaults.standard.set(self.theme.themeSettings, forKey: "Theme")
									self.isThemeChanged.toggle()
								}, label: {
									HStack {
										Image(systemName: "circle.fill")
											.foregroundColor(theme.themeColor)
										Text(theme.themeName)
									}
								})
								.tint(.primary)
								
								
							}
						}
					}, header: {
						HStack {
							Text("Choose the app theme")
							Image(systemName: "circle.fill")
								.resizable()
								.frame(width: 10, height: 10)
								.foregroundColor(themes[self.theme.themeSettings].themeColor)
						}
					})
					.padding(.vertical, 3)
					.alert("Success", isPresented: $isThemeChanged, actions: {}, message: {
						Text("App has been changed to the \(themes[self.theme.themeSettings].themeName)!")
					})
					
					// MARK: - Section 3
					Section(header: Text("Follow us on social media")) {
						FormRowLinkView(icon: "globe", color: Color.pink, text: "Website", link: "https://swiftuimasterclass.com")
						FormRowLinkView(icon: "link", color: Color.blue, text: "Twitter", link: "https://twitter.com/robertpetras")
						FormRowLinkView(icon: "play.rectangle", color: Color.green, text: "Courses", link: "https://www.udemy.com/user/robert-petras")
					}
					.padding(.vertical, 3)
					
					
					
					// MARK: - Section 4
					Section(content: {
						FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
						FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iPhone, iPad")
						FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "John / Jane")
						FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Robert Petras")
						FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.5.0")
					}, header: {
						Text("About the application")
					})
					.padding(.vertical, 3)
				} //: Form
				.listStyle(.grouped)
				.environment(\.horizontalSizeClass, .regular)
				
				
				// MARK: - Footer
				Text("Copyright © All rights reserved.\nBetter Apps ♡ Less Code")
					.multilineTextAlignment(.center)
					.font(.footnote)
					.padding(.top, 6)
					.padding(.bottom, 8)
					.foregroundColor(Color.secondary)
			} //: VStack
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing, content: {
					Button(action: {
						self.dismiss()
					}, label: {
						Image(systemName: "xmark")
					})
				})
			}
			.navigationTitle("Settings")
			.navigationBarTitleDisplayMode(.inline)
			.background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
		} //: Navigation
		.tint(themes[self.theme.themeSettings].themeColor)
		.navigationViewStyle(.stack)
	}
}

struct SettingsView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsView()
			.environmentObject(IconNames())
	}
}
