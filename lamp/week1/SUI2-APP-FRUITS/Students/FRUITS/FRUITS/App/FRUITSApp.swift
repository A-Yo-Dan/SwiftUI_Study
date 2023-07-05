//
//  FRUITSApp.swift
//  FRUITS
//
//  Created by 박민서 on 2023/07/05.
//

import SwiftUI

@main
struct FRUITSApp: App {
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
