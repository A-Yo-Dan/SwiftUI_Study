//
//  PageModel.swift
//  Pinch
//
//  Created by 정현우 on 2023/07/04.
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
