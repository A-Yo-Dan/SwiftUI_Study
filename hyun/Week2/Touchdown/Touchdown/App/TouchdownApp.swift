//
//  TouchdownApp.swift
//  Touchdown
//
//  Created by 정현우 on 2023/07/09.
//

import SwiftUI

@main
struct TouchdownApp: App {
	@StateObject var shop = Shop()
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environmentObject(shop)
        }
    }
}
