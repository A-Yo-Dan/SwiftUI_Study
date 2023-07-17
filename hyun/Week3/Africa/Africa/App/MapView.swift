//
//  MapView.swift
//  Africa
//
//  Created by 정현우 on 2023/07/15.
//

import SwiftUI
import MapKit

struct MapView: View {
	// MARK: - Property
	@State private var region: MKCoordinateRegion = {
		var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
		var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 70)
		var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
		
		return mapRegion
	}()
	
	let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
	
	// MARK: - Body
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
//			MapPin(coordinate: item.location, tint: .accentColor)
//			MapMarker(coordinate: item.location, tint: .accentColor)
//			MapAnnotation(coordinate: item.location, content: {
//				Image("logo")
//					.resizable()
//					.scaledToFit()
//					.frame(width: 32, height: 32, alignment: .center)
//			})
			MapAnnotation(coordinate: item.location, content: {
				// custom view
				MapAnnotationView(location: item)
			})
		}) //: Map
		.overlay(alignment: .top, content: {
			HStack(alignment: .center, spacing: 12) {
				Image("compass")
					.resizable()
					.scaledToFit()
				.frame(width: 48, height: 48, alignment: .center)
				
				VStack(alignment: .leading, spacing: 3) {
					HStack {
						Text("Latitude")
							.font(.footnote)
							.fontWeight(.bold)
							.foregroundColor(.accentColor)
						Spacer()
						Text("\(region.center.latitude)")
							.font(.footnote)
							.foregroundColor(.white)
					}
					
					Divider()
					
					HStack {
						Text("Longitude")
							.font(.footnote)
							.fontWeight(.bold)
							.foregroundColor(.accentColor)
						Spacer()
						Text("\(region.center.longitude)")
							.font(.footnote)
							.foregroundColor(.white)
					}
				}
			} //: HStack
				.padding(.vertical, 12)
				.padding(.horizontal, 16)
				.background(
					Color.black
						.cornerRadius(8)
						.opacity(0.6)
				)
				.padding()
		})
    }
}

// MARK: - Preview
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
