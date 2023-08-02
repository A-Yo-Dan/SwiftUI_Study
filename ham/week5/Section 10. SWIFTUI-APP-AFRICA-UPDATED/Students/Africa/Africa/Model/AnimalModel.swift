//
//  AnimalModel.swift
//  Africa
//
//  Created by 이재혁 on 2023/07/31.
//

import SwiftUI

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
