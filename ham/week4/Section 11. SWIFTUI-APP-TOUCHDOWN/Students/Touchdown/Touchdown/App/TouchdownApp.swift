//
//  TouchdownApp.swift
//  Touchdown
//
//  Created by 이재혁 on 2023/07/25.
//

import SwiftUI

@main
struct TouchdownApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Shop())
        }
    }
}
