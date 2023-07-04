//
//  ContentView.swift
//  HelloWorld
//
//  Created by 박민서 on 2023/06/29.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "face.smiling")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Section2 is done")
        }
        .padding()
        
        Link("go to apple", destination: URL(string: "https://apple.com")!)
            .font(.system(size: 100))
            .fontWeight(.black)
            .foregroundStyle(.teal.gradient)
        Link("call to action", destination: URL(string: "tel:12345")!)
            .font(.system(size: 100))
            .fontWeight(.black)
            .foregroundStyle(
                LinearGradient(colors: [.pink, .purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
