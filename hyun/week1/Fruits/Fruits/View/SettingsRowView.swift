//
//  SettingsRowView.swift
//  Fruits
//
//  Created by 정현우 on 2023/07/05.
//

import SwiftUI

struct SettingsRowView: View {
	
	var name: String
	var content: String? = nil
	var linkLabel: String? = nil
	var linkDestination: String? = nil
	
    var body: some View {
		VStack {
			Divider().padding(.vertical, 4)
			HStack {
				Text(name)
					.foregroundColor(.gray)
				Spacer()
				if content != nil {
					Text(content!)
				} else if (linkLabel != nil) && (linkDestination != nil) {
					Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
					Image(systemName: "arrow.up.right.square")
						.foregroundColor(.pink)
				} else {
					EmptyView()
				}
				
			}
		}
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(name: "Developer", content: "John / Jane")
			.previewLayout(.fixed(width: 375, height: 60))
			.padding()
    }
}
