//
//  Note.swift
//  Notes Watch App
//
//  Created by 이재혁 on 2023/08/08.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
