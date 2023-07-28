//
//  AvocadosApp.swift
//  Avocados
//
//  Created by 정현우 on 2023/07/28.
//

import SwiftUI

@main
struct AvocadosApp: App {
	var body: some Scene {
		WindowGroup {
			TabView {
				AvocadosView()
					.tabItem{
						Image("tabicon-branch")
						Text("Avocados")
					}
					.toolbar(.visible, for: .tabBar)
					.toolbarBackground(Color.yellow, for: .tabBar)
				ContentView()
					.tabItem{
						Image("tabicon-book")
						Text("Recipes")
					}
				RipeningStagesView()
					.tabItem{
						Image("tabicon-avocado")
						Text("Ripening")
					}
				SettingsView()
					.tabItem{
						Image("tabicon-settings")
						Text("Settings")
					}
			}
			.tint(.primary)
			.onAppear {
				UITabBar.appearance().backgroundColor = .systemBackground
			}
			
		}
	}
}
