//
//  FactModel.swift
//  AVOCADO
//
//  Created by 박민서 on 2023/07/20.
//

import SwiftUI

// MARK: - FACT MODEL

struct Fact: Identifiable {
  var id = UUID()
  var image: String
  var content: String
}
