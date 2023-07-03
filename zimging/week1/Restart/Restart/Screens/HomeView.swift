//
//  HomeView.swift
//  Restart
//
//  Created by YOUJIM on 2023/07/03.
//

// AppStorage는 뭔지
// Vstack, HStack, ZStack 각각 뭔지
// option + commend + leftarrow 누르면

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            //: MARK: - HEADER
            
            Spacer()
            
            Image("character-2")
                .resizable()
                .scaledToFit()
                .padding()
            
            // MARK: - CENTER
            
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            // MARK: - FOOTER
            
            
            Button(action: {
                // Automatic view change to OnboardingView
                isOnboardingViewActive = true
            }) {
                Text("Restart")
            }
        } //: VSTACK
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
