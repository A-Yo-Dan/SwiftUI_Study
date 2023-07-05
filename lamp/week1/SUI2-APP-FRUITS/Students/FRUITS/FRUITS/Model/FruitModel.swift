//
//  FruitModel.swift
//  FRUITS
//
//  Created by 박민서 on 2023/07/05.
//

import Foundation
import SwiftUI

// MARK: - FRUITS DATA MODEL

struct Fruit: Identifiable {
  var id = UUID()
  var title: String
  var headline: String
  var image: String
  var gradientColors: [Color]
  var description: String
  var nutrition: [String]
}
