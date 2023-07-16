//
//  SettingsView.swift
//  Notes Watch App
//
//  Created by 서은수 on 2023/07/16.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - Property
    
    @AppStorage("lineCount") var lineCount: Int = 1 // 로컬에 저장됨
    @State private var value: Float = 1.0
    
    // MARK: - Function
    
    func update() {
        lineCount = Int(value)
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 8) {
            // Header
            HeaderView(title: "Settings")
            
            // Actual line count
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)
            
            // Slider
            Slider(value: Binding(get: {
                self.value
            }, set: { newValue in
                self.value = newValue
                update()
            }), in: 1...4, step: 1)
                .accentColor(.accentColor)
        } //: Vstack
    }
}

// MARK: - Preview

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
