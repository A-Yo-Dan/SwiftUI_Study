//
//  Slot_MachineApp.swift
//  Slot-Machine
//
//  Created by 서은수 on 2023/07/16.
//

import SwiftUI

@main
struct Slot_MachineApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onReceive(
                    NotificationCenter.default.publisher(for: UIScene.willConnectNotification)
                ) { _ in
                    #if targetEnvironment(macCatalyst)
                    UIApplication.shared.connectedScenes
                        .compactMap { $0 as? UIWindowScene }
                        .forEach { windowScene in
                            windowScene.sizeRestrictions?.minimumSize = CGSize(width: 600, height: 800)
                            windowScene.sizeRestrictions?.maximumSize = CGSize(width: 600, height: 800)
                        }
                    #endif
                } // Mac Catalyst 윈도우 사이즈 제한 걸기
        }
    }
}
