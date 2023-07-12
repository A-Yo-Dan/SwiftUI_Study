//
//  HeadingView.swift
//  Africa
//
//  Created by 서은수 on 2023/07/11.
//

import SwiftUI

// 컴포넌트를 재사용하기 위해
struct HeadingView: View {
    
    // MARK: - PROPERTIES
    
    var headingImage: String
    var headingText: String
    
    // MARK: - BODY
    
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
    }
}

// MARK: - PREVIEW

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures") // 프리뷰에서 보기 위한 더미 데이터
            .previewLayout(.sizeThatFits) // 컴포넌트 크기에 딱 맞게 프리뷰 사이즈 조정
            .padding() // 상하좌우에 패딩 추가
    }
}
