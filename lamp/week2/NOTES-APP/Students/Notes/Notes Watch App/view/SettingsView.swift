//
//  Settings.swift
//  Notes Watch App
//
//  Created by 박민서 on 2023/07/10.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - PROPERTY
    @AppStorage("linecount") var linecount: Int = 1
    @State private var value: Float = 1.0
    
    //MARK: - FUNCTION
    func update() {
        linecount = Int(value)
    }
    
    //MARK: - BODY
    
    var body: some View {
        VStack(spacing: 8) {
            // HEADER
            HeaderView(title: "Settings")
            
            // ACTUAL LINE COUNT
            Text("Lines: \(linecount)".uppercased())
                .fontWeight(.bold)
            
            // SLIDER
            Slider(value: Binding(get: {
                self.value
            }, set: { newValue in
                self.value = newValue
                self.update() // 커스텀 바인딩하면서 값을 업데이트 해주는 이유..?
            }), in: 1...4, step: 1)
                //.accentColor(.accentColor) // will be deprecated
                .tint(.accentColor)
        }//:VSTACK
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
