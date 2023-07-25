//
//  HeaderModel.swift
//  AVOCADO
//
//  Created by 박민서 on 2023/07/17.
//

import SwiftUI

// MARK: - HEADER MODEL

struct Header: Identifiable {
    var id = UUID()
    var image: String
    var headline: String
    var subheadline: String
}
