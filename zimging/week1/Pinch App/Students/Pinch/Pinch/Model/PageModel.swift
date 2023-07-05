//
//  PageModel.swift
//  Pinch
//
//  Created by YOUJIM on 2023/07/05.
//

import Foundation

struct Page: Identifiable { // 식별 가능
    let id: Int // specifying the identified item
    let imageName: String
}

extension Page {
    var thumbnailName: String {
        return "thumb-" + imageName
    }
}
