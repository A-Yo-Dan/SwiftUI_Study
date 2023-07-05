//
//  SettingsView.swift
//  HIKE!
//
//  Created by 박민서 on 2023/07/05.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        List{
            Section {
                
                //MARK: -SECTION: HEADER
                HStack {
                    Spacer()// to align content to middle
                    
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        
                        Text("Editor's Choice")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    
                    Spacer()// to align content to middle
                }//:HSTACK
                .foregroundStyle(
                    LinearGradient(colors: [
                        .customGreenLight,.customGreenMedium,.customGreenDark
                    ],
                                   startPoint: .top,
                                   endPoint: .bottom
                    )
                )
                .padding(.top, 8)
                
                
                VStack(spacing: 8) {
                    Text("좋은 길이 어디냐?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    Text("니가 직접 가봐 이씨 \n 아니 왤케 김")
                        .font(.footnote)
                        .italic()
                    Text("갈시간이야~")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            } //: HEADER
            .listRowSeparator(.hidden)
            
            //MARK: -SECTION: ICONS
            
            //MARK: -SECTION: ABOUT
            Section(
                header: Text("About the APP"),
                footer: HStack {
                    Spacer()
                    Text("Copyright 나")
                    Spacer()
                }
                    .padding(.vertical, 8)
            ) {
                // 1. Basic Labeled Content
                //LabeledContent("Application", value: "Hike")
                
                // 2. Advanced Labeled Content
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)
                
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS", rowTintColor: .red)
                
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "swift", rowTintColor: .orange)
                
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "LAMP", rowTintColor: .mint)
                
                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo,
                rowLinkLabel: "Naver", rowLinkDestination: "https://naver.com")
                
            }//:Section
        } //: List
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
