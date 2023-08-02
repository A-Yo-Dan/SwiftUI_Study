//
//  FactModel.swift
//  Avocados
//
//  Created by 정현우 on 2023/07/28.
//

import SwiftUI

struct Fact: Identifiable {
	var id = UUID()
	var image: String
	var content: String
}
