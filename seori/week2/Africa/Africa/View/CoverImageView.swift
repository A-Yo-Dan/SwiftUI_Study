//
//  CoverImageView.swift
//  Africa
//
//  Created by 서은수 on 2023/07/10.
//

import SwiftUI

struct CoverImageView: View {
    
    // MARK: - PROPERTIES
    
    // Bundle extension에 있는 decode 함수를 호출
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    // MARK: - BODY
    
    var body: some View {
        TabView {
            // 반복을 통해 탭뷰에 괄호 안의 이미지를 5개 넣은 것
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }
        } //: TAB
        .tabViewStyle(PageTabViewStyle())
    }
}

// MARK: - PREVIEW

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
