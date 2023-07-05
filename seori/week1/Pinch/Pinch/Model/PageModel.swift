//
//  PageModel.swift
//  Pinch
//
//  Created by 서은수 on 2023/07/05.
//

import Foundation

struct Page: Identifiable {
    let id: Int
    let imageName: String
}

// 구조체 확장
extension Page {
    var thumbnailName: String {
        return "thumb-" + imageName
    }
}
