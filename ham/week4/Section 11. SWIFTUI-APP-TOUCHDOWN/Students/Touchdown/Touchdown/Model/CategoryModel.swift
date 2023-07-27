//
//  CategoryModel.swift
//  Touchdown
//
//  Created by 이재혁 on 2023/07/25.
//

import Foundation

struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
