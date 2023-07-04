//
//  PageData.swift
//  Pinch!
//
//  Created by 박민서 on 2023/07/05.
//

import Foundation

let pagesData: [Page] = [
    Page(id: 1, imageName: "magazine-front-cover"),
    Page(id: 2, imageName: "magazine-back-cover")
]

extension Page {
    var thumbnailName: String {
        return "thumb-" + imageName 
    }
}
