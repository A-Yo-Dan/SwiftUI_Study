//
//  ProductModel.swift
//  Touchdown
//
//  Created by 서은수 on 2023/08/07.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
    let price: Int
    let description: String
    let color: [Double]
    
    var red: Double { color[0] }
    var blue: Double { color[1] }
    var green: Double { color[2] }
    var formattedPrice: String { "$\(price)" }
}
