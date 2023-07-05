//
//  ContentView.swift
//  Restart
//
//  Created by 박민서 on 2023/07/03.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    //will set up new onboarding key & App storage
    
    var body: some View {
        ZStack {
            if isOnboardingViewActive {
                OnboardingView()
            } else { 
                HomeView()
            }
        }.animation(.easeOut(duration: 0.5), value: isOnboardingViewActive)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
