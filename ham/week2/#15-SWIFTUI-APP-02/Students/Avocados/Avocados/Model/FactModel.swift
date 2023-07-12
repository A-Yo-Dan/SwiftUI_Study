//
//  FactModel.swift
//  Avocados
//
//  Created by 이재혁 on 2023/07/10.
//

import SwiftUI

// MARK: - FACT MODEL

struct Fact: Identifiable {
    var id = UUID()
    var image: String
    var content: String
}
