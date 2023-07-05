//
//  SourceLinkView.swift
//  Fruits
//
//  Created by 정현우 on 2023/07/05.
//

import SwiftUI

struct SourceLinkView: View {
    var body: some View {
		GroupBox() {
			HStack{
				Text("Content Source")
				Spacer()
				Link("wikipedia", destination: URL(string: "https://wikipedia.com")!)
				Image(systemName: "arrow.up.right.square")
			}
			.font(.footnote)
		}
    }
}

struct SourceLinkView_Previews: PreviewProvider {
    static var previews: some View {
        SourceLinkView()
			.previewLayout(.sizeThatFits)
			.padding()
    }
}
