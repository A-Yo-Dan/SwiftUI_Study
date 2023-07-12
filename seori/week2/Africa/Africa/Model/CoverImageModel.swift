//
//  CoverImageModel.swift
//  Africa
//
//  Created by 서은수 on 2023/07/10.
//

import SwiftUI

// 커버 이미지 데이터 모델
struct CoverImage: Codable, Identifiable {
    let id: Int
    let name: String
}
