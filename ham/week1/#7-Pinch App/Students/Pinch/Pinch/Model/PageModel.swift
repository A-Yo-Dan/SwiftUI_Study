//
//  PageModel.swift
//  Pinch
//
//  Created by 이재혁 on 2023/07/05.
//

import Foundation

struct Page: Identifiable {
    let id: Int
    let imageName: String
}

extension Page {
    var thumbnailName: String {
        return "thumb-" + imageName
    }
}
