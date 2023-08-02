//
//  Shop.swift
//  TouchDown
//
//  Created by 박민서 on 2023/07/31.
//

import Foundation

class Shop: ObservableObject {
  @Published var showingProduct: Bool = false
  @Published var selectedProduct: Product? //= nil
}
