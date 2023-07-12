//
//  HeaderModel.swift
//  Avocados
//
//  Created by 이재혁 on 2023/07/10.
//

import Foundation
import SwiftUI

// MARK: - HEADER MODEL

struct Header: Identifiable {
    var id = UUID()
    var image: String
    var headline: String
    var subheadline: String
}
