//
//  ProductItemView.swift
//  Touchdown
//
//  Created by 정현우 on 2023/07/10.
//

import SwiftUI

struct ProductItemView: View {
	// MARK: - Property
	let product: Product
	
	// MARK: - Body
    var body: some View {
		VStack(alignment: .leading, spacing: 6) {
			ZStack {
				Image(product.image)
					.resizable()
					.scaledToFit()
					.padding(10)
			}
			.background(Color(red: product.red, green: product.green, blue: product.blue))
			.cornerRadius(12)
			
			Text(product.name)
				.font(.title3)
				.fontWeight(.black)
			
			Text(product.formattedPrice)
				.fontWeight(.semibold)
				.foregroundColor(.gray)
		}
    }
}

// MARK: - Preview
struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(product: products[0])
			.previewLayout(.fixed(width: 200, height: 300))
			.padding()
			.background(colorBackground)
    }
}
