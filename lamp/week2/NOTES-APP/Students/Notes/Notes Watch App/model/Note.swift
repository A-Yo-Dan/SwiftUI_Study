//
//  Note.swift
//  Notes Watch App
//
//  Created by 박민서 on 2023/07/09.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
