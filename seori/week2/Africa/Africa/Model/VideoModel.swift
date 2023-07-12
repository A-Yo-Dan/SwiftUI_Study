//
//  VideoModel.swift
//  Africa
//
//  Created by 서은수 on 2023/07/12.
//

import Foundation

// MARK: - 비디오 데이터 모델

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed Property
    var thumnail: String {
        "video-\(id)"
    }
}
