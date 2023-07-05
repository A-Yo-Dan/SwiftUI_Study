//
//  CustomButtonView.swift
//  Hike
//
//  Created by YOUJIM on 2023/07/05.
//

import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(
                    colors: [.white,
                             .customGreenLight,
                             .customGreenMedium],
                    startPoint: .top,
                    endPoint: .bottom)
                )
            
            Circle()
                .stroke(LinearGradient(
                    colors: [
                        .customGrayLight,
                        .customGrayMedium],
                    startPoint: .top,
                    endPoint: .bottom),
                        lineWidth: 4)
            
            Image(systemName: "figure.hiking")
                .fontWeight(.black)
                .font(.system(size: 30))
                .foregroundStyle(
                    LinearGradient(colors: [
                        .customGrayDark,
                        .customGrayMedium],
                                   startPoint: .top,
                                   endPoint: .bottom)
                )
            
            Spacer()
        }
        .frame(width: 58, height: 58)
    }
}

struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
