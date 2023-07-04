//
//  Sec3_chap21.swift
//  HelloWorld
//
//  Created by 박민서 on 2023/06/29.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View{
        self
            .resizable()
            .scaledToFit()
    }
    
    // we can use previous function in same scope in Swift
    func iconModifier() -> some View{
        self
            .imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}

struct AsyncImageView : View {
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View{
        //download & display image
        AsyncImage(url: URL(string: imageURL)) { image in
            image.imageModifier()
        } placeholder: {
            Image(systemName: "photo.circle.fill").iconModifier()
        }
        .padding(40)
    }
}
 
struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView()
    }
}
