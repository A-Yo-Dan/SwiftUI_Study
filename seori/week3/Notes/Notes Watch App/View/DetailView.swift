//
//  DetailView.swift
//  Notes Watch App
//
//  Created by 서은수 on 2023/07/16.
//

import SwiftUI

struct DetailView: View {
    
    // MARK: - Property
    
    let note: Note
    let count: Int
    let index: Int
    
    @State private var isCreditsPresented: Bool = false
    @State private var isSettingsPresented: Bool = false
    
    // MARK: - View
    
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            HeaderView()
            
            Spacer()
            
            ScrollView(.vertical) {
                Text("\(note.text)")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            } //: Scroll
            
            Spacer()
            
            // Footer
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingsPresented.toggle()
                    }
                    .sheet(isPresented: $isSettingsPresented) {
                        SettingsView()
                    }
                
                Spacer()
                
                Text("\(index + 1) / \(count)")
                
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditsPresented.toggle()
                    }
                    .sheet(isPresented: $isCreditsPresented) {
                        CreditsView()
                    }
            } //: Hstack
            .foregroundColor(.secondary)
        } //: Vstack
        .padding(3) // Vstack의 상하좌우에 패딩 3씩 추가
    }
}

struct DetailView_Previews: PreviewProvider {
    static var sampleData: Note = Note(id: UUID(), text: "Hello, World!")
    
    static var previews: some View {
        DetailView(note: sampleData, count: 5, index: 1)
    }
}
