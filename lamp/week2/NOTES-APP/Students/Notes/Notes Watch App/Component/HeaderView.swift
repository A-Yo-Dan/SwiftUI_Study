//
//  HeaderView.swift
//  Notes Watch App
//
//  Created by 박민서 on 2023/07/10.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - PROPERTY
    var title: String = ""
    
    // MARK: - BODY
    var body: some View {
        VStack {
            //Title
            if title != "" {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            }
            // Seperator
            HStack{
                Capsule()
                    .frame(height: 1)
                Image(systemName: "note.text")
                Capsule()
                    .frame(height: 1)
                
            } //: HSTACK
            .foregroundColor(.accentColor)
        }//: VStack
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            HeaderView(title: "Credits")
            
            HeaderView()
            
            CreditsView()
        }
        
    }
}
