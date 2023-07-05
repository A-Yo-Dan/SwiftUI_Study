//
//  ControlImageView.swift
//  Pinch
//
//  Created by YOUJIM on 2023/07/05.
//

// previewLayout(.sizeThatFits) 이건 안먹는건가?

import SwiftUI

struct ControlImageView: View {
    let icon : String
    
    var body: some View {
        Image(systemName: icon)
            .font(.system(size: 36))
    }
}

struct ControlImageView_Previews: PreviewProvider {
    static var previews: some View {
        ControlImageView(icon: "minus.magnifyingglass")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
