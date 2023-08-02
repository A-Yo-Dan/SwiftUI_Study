//
//  DEVOTEApp.swift
//  DEVOTE
//
//  Created by 박민서 on 2023/08/02.
//

import SwiftUI

@main
struct DEVOTEApp: App {
    let persistenceController = PersistenceController.shared //adding persistent Controller for using CoreData
    
    @AppStorage("isDarkMode") var isDarkMode: Bool = false

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            // managedObjectContext will be on WindowGroup lifcycle, which mean whole time using this app
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
