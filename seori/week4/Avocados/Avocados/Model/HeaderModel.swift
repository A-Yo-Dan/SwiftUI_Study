//
//  HeaderModel.swift
//  Avocados
//
//  Created by 서은수 on 2023/07/23.
//

import SwiftUI

struct Header: Identifiable {
    var id = UUID()
    var image: String
    var headline: String
    var subheadline: String
}
