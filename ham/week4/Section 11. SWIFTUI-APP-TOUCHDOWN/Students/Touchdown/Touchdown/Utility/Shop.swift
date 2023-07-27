//
//  Shop.swift
//  Touchdown
//
//  Created by 이재혁 on 2023/07/26.
//

import Foundation

class Shop: ObservableObject {
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: Product? = nil
}
