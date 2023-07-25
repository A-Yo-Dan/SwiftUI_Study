//
//  CardModel.swift
//  Developers
//
//  Created by 박민서 on 2023/07/26.
//

import SwiftUI

// MARK: - CARD MODEL

struct Card: Identifiable {
  var id = UUID()
  var title: String
  var headline: String
  var imageName: String
  var callToAction: String
  var message: String
  var gradientColors: [Color]
}
