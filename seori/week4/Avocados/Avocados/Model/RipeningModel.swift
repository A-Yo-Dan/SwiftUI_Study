//
//  RipeningModel.swift
//  Avocados
//
//  Created by 서은수 on 2023/07/25.
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
