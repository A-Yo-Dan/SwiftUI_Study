//
//  HeaderView.swift
//  Notes Watch App
//
//  Created by 서은수 on 2023/07/16.
//

import SwiftUI

struct HeaderView: View {
    var title: String = ""
    
    var body: some View {
        // Header
        VStack {
            // Title
            // title에 뭐가 적혀있을 때면 헤더 상단에 타이틀을 생성
            if title != "" {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            }
            
            // Separator
            HStack {
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            } //: Hstack
            .foregroundColor(.accentColor)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Credits")
        
        HeaderView()
    }
}
