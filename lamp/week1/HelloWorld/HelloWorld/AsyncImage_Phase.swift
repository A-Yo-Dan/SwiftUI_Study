//
//  Sec3_chap21.swift
//  HelloWorld
//
//  Created by 박민서 on 2023/06/29.
//

import SwiftUI


struct AsyncImage_PhaseView : View {
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View{
        AsyncImage(url: URL(string: imageURL)) { phase in
            // 3 states of phase -> Success, Failure, Empty
            if let image = phase.image { // success
                image.imageModifier()
            } else if phase.error != nil { // failure
                Image(systemName: "ant.circle.fill").iconModifier()
            } else { // empty
                Image(systemName: "photo.circle.fill").iconModifier()
            }
        }
        .padding(40)
    }
}
 
struct AsyncImage_PhaseView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImage_PhaseView()
    }
}
