//
//  LocationModel.swift
//  Africa
//
//  Created by 정현우 on 2023/07/16.
//

import Foundation
import MapKit

struct NationalParkLocation: Codable, Identifiable {
	var id: String
	var name: String
	var image: String
	var latitude: Double
	var longitude: Double
	
	var location: CLLocationCoordinate2D {
		CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
	}
}
