//
//  CategoryModel.swift
//  Touchdown
//
//  Created by 정현우 on 2023/07/10.
//

import Foundation

struct Category: Codable, Identifiable {
	let id: Int
	let name: String
	let image: String
}
