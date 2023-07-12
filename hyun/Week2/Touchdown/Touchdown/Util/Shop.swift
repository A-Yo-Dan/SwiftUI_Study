//
//  Shop.swift
//  Touchdown
//
//  Created by 정현우 on 2023/07/11.
//

import Foundation

class Shop: ObservableObject {
	@Published var showingProduct: Bool = false
	@Published var selectedProduct: Product? = nil
}
