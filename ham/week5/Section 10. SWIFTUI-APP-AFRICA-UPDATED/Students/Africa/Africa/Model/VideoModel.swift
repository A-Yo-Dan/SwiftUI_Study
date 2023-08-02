//
//  VideoModel.swift
//  Africa
//
//  Created by 이재혁 on 2023/07/31.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed Property
    var thumbnail: String {
        "video-\(id)"
    }
}
