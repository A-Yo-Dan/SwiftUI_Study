//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by 서은수 on 2023/07/12.
//

import SwiftUI

struct ExternalWeblinkView: View {
    
    // MARK: - PROPERTIES
    
    let animal: Animal
    
    // MARK: - BODY
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                
                Spacer() // 오른쪽에 여백을 추가해서 좌우로 길쭉하게 만든다
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!)
                }
                .foregroundColor(.accentColor) // 2개를 Group으로 묶어서 이렇게 단 한번에 색 설정
            } //: HSTACK
        } //: BOX
        .padding(.bottom, 10)
    }
}

// MARK: - PREVIEW

struct ExternalWeblinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        ExternalWeblinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
