//
//  DetailView.swift
//  Notes Watch App
//
//  Created by 박민서 on 2023/07/10.
//

import SwiftUI

struct DetailView: View {
    // MARK: - PROPERTY
    let note: Note
    let count: Int
    let index: Int
    
    @State private var isCreditsPresented: Bool = false
    @State private var isSettingPresented: Bool = false
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            //HEADER
            HeaderView(title: "")
            
            //CONTENT
            Spacer()
            
            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            //FOOTER
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingPresented.toggle()
                    }
                    .sheet(isPresented: $isSettingPresented, content: {
                        SettingsView()
                    })
                
                Spacer()
                
                Text("\(index + 1) / \(count)")
                
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditsPresented.toggle()
                    }
                    .sheet(isPresented: $isCreditsPresented, content: {
                        CreditsView()
                    })
            }//: HSTACK
            .foregroundColor(.secondary)
        }//:VSTACK
        .padding(3)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var sampleData: Note = Note(id: UUID(), text: "This is sample")
    static var previews: some View {
        DetailView(note: sampleData, count: 5, index: 1)
    }
}
