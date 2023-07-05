//
//  FruitModel.swift
//  Fructus
//
//  Created by 이재혁 on 2023/07/05.
//

import SwiftUI

// MARK: - FRUITS DATA MODEL

struct Fruit: Identifiable {
    var id = UUID() // Universally Unique Identifier
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
    var description: String
    var nutrition: [String]
}
