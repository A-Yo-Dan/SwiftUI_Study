//
//  Sec3_chap21.swift
//  HelloWorld
//
//  Created by 박민서 on 2023/06/29.
//

import SwiftUI

struct AsyncImage_PhaseAnimationView : View {
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    let transaction_1 = Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))
    
    var body: some View{
        AsyncImage(url: URL(string: imageURL), transaction: transaction_1) { phase in
            // 3 states of phase -> Success, Failure, Empty
            switch phase {
            case .success(let image):
                image
                    .imageModifier()
                    //.transition(.move(edge: .bottom))
                    //.transition(.slide)
                    .transition(.scale)
            case .failure(let error) :
                Image(systemName: "ant.circle.fill").iconModifier()
                //print(error.localizedDescription)
            case .empty :
                Image(systemName: "photo.circle.fill").iconModifier()
            @unknown default:
                ProgressView()
            }
        }
        .padding(40)
    }
}
 
struct AsyncImage_PhaseAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImage_PhaseAnimationView()
    }
}
