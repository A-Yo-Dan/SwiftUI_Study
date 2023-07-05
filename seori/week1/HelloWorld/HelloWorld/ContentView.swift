//
//  ContentView.swift
//  HelloWorld
//
//  Created by 서은수 on 2023/07/01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // Test VStack
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        
        // Test Link
        Link(destination: URL(string: "https://www.naver.com")!) {
            HStack(spacing: 16) {
                Image(systemName: "apple.logo")
                Text("Apple Store")
            }
            .buttonStyle(.bordered)
            .foregroundColor(.white)
            .padding()
            .background(
                Capsule()
                    .fill(Color.blue)
            )
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
