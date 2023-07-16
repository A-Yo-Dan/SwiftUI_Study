//
//  CreditsView.swift
//  Notes Watch App
//
//  Created by 서은수 on 2023/07/16.
//

import SwiftUI

struct CreditsView: View {
    
    // MARK: - PROPERTY
    
    // 1에서 3 사이(4 미만)의 랜덤 숫자 생성
    @State private var randomNumber: Int = Int.random(in: 1..<4)
    
    private var randomImage: String {
        return "developer-no\(randomNumber)"
    }
    
    // MARK: - BODY
    
    var body: some View {
        VStack(spacing: 3) {
            // Profile Image
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            
            // Header
            HeaderView(title: "Credits")
            
            // Content
            Text("Seo Seori")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
            
        } //: Vstack
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
