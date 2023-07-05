//
//  FruitModel.swift
//  Fruits
//
//  Created by 정현우 on 2023/07/05.
//

import SwiftUI

struct Fruit: Identifiable {
	let id = UUID()
	var title: String
	var headline: String
	var image: String
	var gradientColors: [Color]
	var description: String
	var nutrition: [String]
}
