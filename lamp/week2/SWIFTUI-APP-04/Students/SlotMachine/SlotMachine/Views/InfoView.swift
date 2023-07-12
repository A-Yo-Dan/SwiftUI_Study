//
//  InfoView.swift
//  SlotMachine
//
//  Created by 박민서 on 2023/07/12.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            LogoView()
            
            Spacer()
            
            Form {
                Section(header: Text("About the application")) {
                    FormRowView(firstItem: "Application", secondItem: "Slot Machine")
                    FormRowView(firstItem: "Platforms", secondItem: "iPhone, iPad, Mac")
                    FormRowView(firstItem: "Developer", secondItem: "John / Jane")
                    FormRowView(firstItem: "Designer", secondItem: "Robert petras")
                    FormRowView(firstItem: "Music", secondItem: "STOP IT")
                }
            }
            .font(.system(.body, design: .rounded))
        }
        .padding(.top, 40)
        .overlay(
            Button {
                audioPlayer?.stop()
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark.circle")
            }
                //.font(.system(size: 25, weight: .bold, design: .rounded))
                .padding(.top, 30)
                .padding(.trailing, 30)
                .tint(Color.secondary)
            , alignment: .topTrailing)
        .onAppear(perform: {
          playSound(sound: "background-music", type: "mp3")
        })
    }
}

struct FormRowView: View {
    var firstItem: String
    var secondItem: String
    
    var body: some View {
        HStack {
            Text(firstItem).foregroundColor(Color.gray)
            Spacer()
            Text(secondItem)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

