//
//  Note.swift
//  Notes Watch App
//
//  Created by 정현우 on 2023/07/24.
//

import Foundation

struct Note: Identifiable, Codable {
	let id: UUID
	let text: String
}
