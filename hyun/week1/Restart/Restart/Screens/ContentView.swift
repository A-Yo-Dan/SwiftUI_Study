//
//  ContentView.swift
//  Restart
//
//  Created by 정현우 on 2023/07/04.
//

import SwiftUI

struct ContentView: View {
	@AppStorage("onboarding") var isOnboardingViewActive: Bool = false
	
    var body: some View {
		ZStack {
			if isOnboardingViewActive {
				OnboardingView()
			} else {
				HomeView()
			}
		}
		.animation(.easeOut(duration: 0.5), value: isOnboardingViewActive)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
