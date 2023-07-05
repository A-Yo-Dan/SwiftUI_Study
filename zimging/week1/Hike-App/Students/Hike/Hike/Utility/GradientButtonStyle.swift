//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by YOUJIM on 2023/07/05.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                // Conditional Statement with Nil Coalescing
                // Condition ? A : B
                configuration.isPressed ?
                // A: When User pressed the Button
                LinearGradient(colors: [Color.customGrayMedium, Color.customGrayLight], startPoint: .top, endPoint: .bottom)
                :
                // B: When the Button is not pressed
                LinearGradient(colors: [Color.customGrayLight, Color.customGrayMedium], startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(40)
    }
}
