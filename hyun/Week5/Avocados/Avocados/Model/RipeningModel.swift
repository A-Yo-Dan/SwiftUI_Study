//
//  RipeningModel.swift
//  Avocados
//
//  Created by 정현우 on 2023/07/28.
//

import SwiftUI

struct Ripening: Identifiable {
	var id = UUID()
	var image: String
	var stage: String
	var title: String
	var description: String
	var ripeness: String
	var instruction: String
}
