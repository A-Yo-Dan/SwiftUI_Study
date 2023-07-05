//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by 서은수 on 2023/07/05.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            
            // MARK: - 3. Depth
            Color.customGreenDark
                .cornerRadius(40)
                .offset(y: 12)
            
            // MARK: - 2. Light
            Color.customGreenLight
                .cornerRadius(40)
                .offset(y: 4)
                .opacity(0.85)
            
            // MARK: - 1. Surface
            
            LinearGradient(
                colors: [.customGreenLight, .customGreenMedium],
                startPoint: .top,
                endPoint: .bottom
            )
            .cornerRadius(40)
        }
    }
}

// MARK: - PREVIEW

struct CustomBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        CustomBackgroundView()
            .padding()
    }
}
