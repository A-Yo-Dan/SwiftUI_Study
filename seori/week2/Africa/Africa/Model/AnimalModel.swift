//
//  AnimalModel.swift
//  Africa
//
//  Created by 서은수 on 2023/07/10.
//

import SwiftUI

// 동물 데이터 모델
struct Animal: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}
