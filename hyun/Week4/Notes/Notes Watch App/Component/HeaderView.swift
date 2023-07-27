//
//  HeaderView.swift
//  Notes Watch App
//
//  Created by 정현우 on 2023/07/24.
//

import SwiftUI

struct HeaderView: View {
	var title: String = ""
	
	var body: some View {
		VStack {
			// Title
			if title != "" {
				Text(title.uppercased())
					.font(.title3)
					.fontWeight(.bold)
					.foregroundColor(.accentColor)
			}
			
			// Seperator
			HStack {
				Capsule()
					.frame(height: 1)
				Image(systemName: "note.text")
				
				Capsule()
					.frame(height: 1)
			}
			.foregroundColor(.accentColor)
		}
	}
}

struct HeaderView_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			HeaderView(title: "Credits")
			HeaderView()
		}
		
	}
}
