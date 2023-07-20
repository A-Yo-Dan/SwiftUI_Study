//
//  Note.swift
//  Notes Watch App
//
//  Created by 서은수 on 2023/07/15.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
