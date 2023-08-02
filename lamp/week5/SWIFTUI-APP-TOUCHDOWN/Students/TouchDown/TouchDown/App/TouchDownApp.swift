//
//  TouchDownApp.swift
//  TouchDown
//
//  Created by 박민서 on 2023/07/30.
//

import SwiftUI

@main
struct TouchDownApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Shop())
        }
    }
}
