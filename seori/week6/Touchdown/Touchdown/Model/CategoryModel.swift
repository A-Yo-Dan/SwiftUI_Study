//
//  CategoryModel.swift
//  Touchdown
//
//  Created by 서은수 on 2023/08/07.
//

import Foundation

struct Category: Identifiable, Codable {
    let id: Int
    let name: String
    let image: String
}
