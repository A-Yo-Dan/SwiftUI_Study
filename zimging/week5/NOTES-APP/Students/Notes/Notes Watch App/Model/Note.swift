//
//  Note.swift
//  Notes Watch App
//
//  Created by YOUJIM on 2023/08/01.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
