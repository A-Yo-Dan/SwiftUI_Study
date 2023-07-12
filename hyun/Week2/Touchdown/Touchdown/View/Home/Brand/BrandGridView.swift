//
//  BrandGridView.swift
//  Touchdown
//
//  Created by 정현우 on 2023/07/10.
//

import SwiftUI

struct BrandGridView: View {
    var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			LazyHGrid(rows: gridLayout, spacing: columnSpacing) {
				ForEach(brands) { brand in
					BrandItemView(brand: brand)
				}
			}
			.frame(height: 200)
			.padding(15)
		}
    }
}

struct BrandGridView_Previews: PreviewProvider {
    static var previews: some View {
        BrandGridView()
			.previewLayout(.sizeThatFits)
			.background(colorBackground)
    }
}
