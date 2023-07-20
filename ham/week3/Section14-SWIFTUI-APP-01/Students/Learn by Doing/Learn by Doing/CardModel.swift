//
//  CardModel.swift
//  Learn by Doing
//
//  Created by 이재혁 on 2023/07/17.
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
