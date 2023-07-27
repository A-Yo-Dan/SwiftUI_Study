//
//  FooterView.swift
//  Honeymoon
//
//  Created by 서은수 on 2023/07/25.
//

import SwiftUI

struct FooterView: View {
    
    @Binding var showBookingAlert: Bool
    let haptics = UINotificationFeedbackGenerator()
    
    var body: some View {
        HStack {
            Image(systemName: "xmark.circle")
                .font(.system(size: 42, weight: .light))
            
            Spacer()
            
            Button {
//                print("success!")
                playSound(sound: "sound-click", type: "mp3")
                haptics.notificationOccurred(.success)
                self.showBookingAlert.toggle()
            } label: {
                Text("Book Destination".uppercased())
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.heavy)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .foregroundColor(.pink)
                    .background(
                        Capsule().stroke(lineWidth: 2).foregroundColor(.pink)
                    )
            }
            
            Spacer()

            Image(systemName: "heart.circle")
                .font(.system(size: 42, weight: .light))
        }
        .padding()
    }
}

struct FooterView_Previews: PreviewProvider {
    @State static var showAlert: Bool = false
    
    static var previews: some View {
        FooterView(showBookingAlert: $showAlert)
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
