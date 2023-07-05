//
//  SettingsView.swift
//  FRUITS
//
//  Created by 박민서 on 2023/07/05.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
          ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
              // MARK: - SECTION 1
              
              GroupBox(
                label:
                  SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
              ) {
                Divider().padding(.vertical, 4)
                
                HStack(alignment: .center, spacing: 10) {
                  Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .cornerRadius(9)
                  
                  Text("그냥 과일 먹으라고 뭔 말이 많아")
                    .font(.footnote)
                }
              }
              
              // MARK: - SECTION 2
              
              GroupBox(
                label: SettingsLabelView(labelText: "Customization", labelImage: "paintbrush")
              ) {
                Divider().padding(.vertical, 4)
                
                Text("끄고 자라")
                  .padding(.vertical, 8)
                  .frame(minHeight: 60)
                  .layoutPriority(1)
                  .font(.footnote)
                  .multilineTextAlignment(.leading)
                
                Toggle(isOn: $isOnboarding) {
                  if isOnboarding {
                    Text("Restarted".uppercased())
                      .fontWeight(.bold)
                      .foregroundColor(Color.green)
                  } else {
                    Text("Restart".uppercased())
                      .fontWeight(.bold)
                      .foregroundColor(Color.secondary)
                  }
                }
                .padding()
                .background(
                  Color(UIColor.tertiarySystemBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                )
              }
              
              // MARK: - SECTION 3
              
              GroupBox(
                label:
                SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
              ) {
                SettingsRowView(name: "Developer", content: "John / Jane")
                SettingsRowView(name: "Designer", content: "Robert Petras")
                SettingsRowView(name: "Compatibility", content: "iOS 16")
                SettingsRowView(name: "Website", linkLabel: "Credo Academy", linkDestination: "credo.academy")
                SettingsRowView(name: "Twitter", linkLabel: "@RobertPetras", linkDestination: "twitter.com/robertpetras")
                SettingsRowView(name: "SwiftUI", content: "4")
                SettingsRowView(name: "Version", content: "1.5.0")
              }
              
            } //: VSTACK
            .navigationBarTitle(Text("Settings"), displayMode: .large)
            .navigationBarItems(
              trailing:
                Button(action: {
                  presentationMode.wrappedValue.dismiss()
                }) {
                  Image(systemName: "xmark")
                }
            )
            .padding()
          } //: SCROLL
        } //: NAVIGATION
      }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
