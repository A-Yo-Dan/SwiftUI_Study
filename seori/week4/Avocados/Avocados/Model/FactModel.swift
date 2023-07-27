//
//  FactModel.swift
//  Avocados
//
//  Created by 서은수 on 2023/07/25.
//

import SwiftUI

// MARK: - FACT MODEL

struct Fact: Identifiable {
    var id = UUID()
    var image: String
    var content: String
}
