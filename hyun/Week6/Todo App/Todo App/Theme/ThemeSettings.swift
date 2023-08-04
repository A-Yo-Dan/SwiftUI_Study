//
//  ThemeSettings.swift
//  Todo App
//
//  Created by 정현우 on 2023/08/04.
//

import SwiftUI

class ThemeSettings: ObservableObject {
	@Published var themeSettings: Int = UserDefaults.standard.integer(forKey: "Theme") {
		didSet {
			UserDefaults.standard.set(self.themeSettings, forKey: "Theme")
		}
	}
}
