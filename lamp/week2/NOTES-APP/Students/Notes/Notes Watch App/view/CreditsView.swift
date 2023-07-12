//
//  CreditsView.swift
//  Notes Watch App
//
//  Created by 박민서 on 2023/07/10.
//

import SwiftUI

struct CreditsView: View {
    //MARK: - PROPERTY
    @State private var randomnumber: Int = Int.random(in: 1..<4)
    private var randomImage: String {
        return "developer-no\(randomnumber)"
    }
    
    //MARK: - BODY
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
            Text("박 민 서")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            Text("백 수")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
            
        }//: VStack
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
