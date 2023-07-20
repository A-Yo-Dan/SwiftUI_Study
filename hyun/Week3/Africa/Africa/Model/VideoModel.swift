//
//  VideoModel.swift
//  Africa
//
//  Created by 정현우 on 2023/07/16.
//

import Foundation

struct Video: Codable, Identifiable {
	let id: String
	let name: String
	let headline: String
	
	var thumbnail: String {
		"video-\(id)"
	}
}
