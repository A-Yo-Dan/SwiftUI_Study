//
//  BrandItemView.swift
//  Touchdown
//
//  Created by 정현우 on 2023/07/10.
//

import SwiftUI

struct BrandItemView: View {
	// MARK: - Property
	let brand: Brand
	
	// MARK: - Body
    var body: some View {
		Image(brand.image)
			.resizable()
			.scaledToFit()
			.padding()
			.background(Color.white.cornerRadius(12))
			.background(
				RoundedRectangle(cornerRadius: 12).stroke(.gray, lineWidth: 1)
			)
    }
}

struct BrandItemView_Previews: PreviewProvider {
    static var previews: some View {
        BrandItemView(brand: brands[0])
			.previewLayout(.sizeThatFits)
			.padding()
			.background(colorBackground)
    }
}
