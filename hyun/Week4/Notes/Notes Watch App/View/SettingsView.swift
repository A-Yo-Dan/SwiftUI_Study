//
//  SettingsView.swift
//  Notes Watch App
//
//  Created by 정현우 on 2023/07/24.
//

import SwiftUI

struct SettingsView: View {
	@AppStorage("lineCount") var lineCount: Int = 1
	@State private var value: Float = 1.0
	
	func update() {
		lineCount = Int(value)
	}
	
    var body: some View {
		VStack(spacing: 8) {
			HeaderView(title: "Settings")
			Text("Lines: \(lineCount)".uppercased())
				.fontWeight(.bold)
			
			Slider(value: Binding(get: {
				self.value
			}, set: { newValue in
				self.value = newValue
				self.update()
			}), in: 1...4, step: 1)
				.tint(.accentColor)
		}
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
