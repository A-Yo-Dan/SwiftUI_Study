//
//  FruitsApp.swift
//  Fruits
//
//  Created by 정현우 on 2023/07/05.
//

import SwiftUI

@main
struct FruitsApp: App {
	@AppStorage("isOnboarding") var isOnboarding: Bool = true
	
    var body: some Scene {
        WindowGroup {
			if isOnboarding {
				OnboardingView()
			} else {
				ContentView()
			}
            
        }
    }
}
