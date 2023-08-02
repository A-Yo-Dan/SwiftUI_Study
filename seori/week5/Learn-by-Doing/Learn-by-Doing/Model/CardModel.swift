//
//  CardModel.swift
//  Learn-by-Doing
//
//  Created by 서은수 on 2023/07/30.
//

import SwiftUI

// MARK: - Card Model

struct Card: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
}
