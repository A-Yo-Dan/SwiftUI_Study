//
//  CardModel.swift
//  Learn by Doing
//
//  Created by 정현우 on 2023/08/03.
//

import SwiftUI

struct Card: Identifiable {
	var id = UUID()
	var title: String
	var headline: String
	var imageName: String
	var callToAction: String
	var message: String
	var gradientColors: [Color]
}
