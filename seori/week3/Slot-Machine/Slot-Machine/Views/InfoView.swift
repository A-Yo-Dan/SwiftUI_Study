//
//  InfoView.swift
//  Slot-Machine
//
//  Created by 서은수 on 2023/07/17.
//

import SwiftUI

struct InfoView: View {
    
    @Environment(\.presentationMode) var presentationMode // X 버튼 클릭 시 이 시트를 닫을 수 있도록
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            LogoView()
            
            Spacer()
            
            Form {
                Section(header: Text("About the application")) {
                    FormRowView(firstItem: "Application", secondItem: "Slot Machine")
                    FormRowView(firstItem: "Platforms", secondItem: "iPhone, iPad, Mac")
                    FormRowView(firstItem: "Developer", secondItem: "Grace / Seori")
                    FormRowView(firstItem: "Designer", secondItem: "Seori")
                    FormRowView(firstItem: "Music", secondItem: "Seo Seori")
                    FormRowView(firstItem: "Website", secondItem: "swiftuimasterclass.com")
                    FormRowView(firstItem: "Copyright", secondItem: "2023 All rights reserved.")
                    FormRowView(firstItem: "Version", secondItem: "1.0.0")
                }
            }
            .font(.system(.body, design: .rounded))
        }
        .padding(.top, 40)
        .overlay(
            // 엑스 버튼 -> 필수적인 건 아닌데 mac 환경에서는 상당히 유용함
            Button(action: {
                audioPlayer?.stop()
                // Action
                self.presentationMode.wrappedValue.dismiss() // 이 시트를 close 해줌
            }, label: {
                Image(systemName: "xmark.circle")
                    .font(.title)
            })
            .padding(.top, 30)
            .padding(.trailing, 20)
            .accentColor(.secondary)
            , alignment: .topTrailing
        )
        .onAppear {
            playSound(sound: "background-music", type: "mp3")
        }
        
    }
}

struct FormRowView: View {
    var firstItem: String
    var secondItem: String
    
    var body: some View {
        HStack {
            Text(firstItem)
                .foregroundColor(.gray)
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
