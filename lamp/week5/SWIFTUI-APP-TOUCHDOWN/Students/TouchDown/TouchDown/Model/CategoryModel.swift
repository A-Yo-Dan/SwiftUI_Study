//
//  CategoryModel.swift
//  TouchDown
//
//  Created by 박민서 on 2023/07/31.
//

import Foundation

struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
