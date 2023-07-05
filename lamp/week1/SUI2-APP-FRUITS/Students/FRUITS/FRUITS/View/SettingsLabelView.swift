//
//  SettingsLabelView.swift
//  FRUITS
//
//  Created by 박민서 on 2023/07/05.
//

import SwiftUI

struct SettingsLabelView: View {
    // MARK: - PROPERTIES
    
    var labelText: String
    var labelImage: String

    // MARK: - BODY
    
    var body: some View {
        HStack {
          Text(labelText.uppercased()).fontWeight(.bold)
          Spacer()
          Image(systemName: labelImage)
        }
    }
}

struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
