//
//  SourceLinkView.swift
//  FRUITS
//
//  Created by 박민서 on 2023/07/05.
//

import SwiftUI

struct SourceLinkView: View {
  var body: some View {
    GroupBox() {
      HStack {
        Text("Content source")
        Spacer()
        Link("Wikipedia", destination: URL(string: "https://wikipedia.com")!)
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

