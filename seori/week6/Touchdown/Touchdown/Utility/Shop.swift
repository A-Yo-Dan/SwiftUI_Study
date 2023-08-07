//
//  Shop.swift
//  Touchdown
//
//  Created by 서은수 on 2023/08/07.
//

import Foundation

class Shop: ObservableObject {
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: Product? = nil
}
