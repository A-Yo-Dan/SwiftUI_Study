//
//  TouchdownApp.swift
//  Touchdown
//
//  Created by 서은수 on 2023/08/07.
//

import SwiftUI

@main
struct TouchdownApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Shop()) // From now on, we can access the properties of the shop class anywhere.
        }
    }
}
