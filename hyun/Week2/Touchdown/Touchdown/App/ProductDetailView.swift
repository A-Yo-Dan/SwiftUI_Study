//
//  ProductDetailView.swift
//  Touchdown
//
//  Created by 정현우 on 2023/07/10.
//

import SwiftUI

struct ProductDetailView: View {
	// MARK: - Properties
	@EnvironmentObject var shop: Shop
	
	// MARK: - Body
    var body: some View {
		VStack(alignment: .leading, spacing: 5) {
			// NavBar
			NavigationBarDetailView()
				.padding(.horizontal)
			// Header
			HeaderDetailView()
				.padding(.horizontal)
			
			// Detail Top Part
			TopPartDetailView()
				.padding(.horizontal)
				.zIndex(1)
			
			// Detail Bottom Part
			VStack(alignment: .center, spacing: 0) {
				// Ratings + Sizes
				RatingSizesDetailView()
					.padding(.top, -20)
					.padding(.bottom, 10)
				
				// Description
				ScrollView(.vertical, showsIndicators: false) {
					Text(shop.selectedProduct?.description ?? sampleProduct.description)
						.font(.system(.body, design: .rounded))
						.foregroundColor(.gray)
						.multilineTextAlignment(.leading)
				}
				
				// Quantity + Favorite
				QuantityFavoriteDetailView()
					.padding(.vertical, 10)
				
				// Add to cart
				AddToCardDetailView()
				
				
			} //: VStack
			.padding(.horizontal)
			.background(
				Color.white
					.clipShape(CustomShape())
					.padding(.top, -105)
					.ignoresSafeArea(.all, edges: .all)
			)
			

		} //: VStack
		.zIndex(0)
		.background(
			Color(
				red: shop.selectedProduct?.red ?? sampleProduct.red,
				green: shop.selectedProduct?.green ?? sampleProduct.green,
				blue: shop.selectedProduct?.blue ?? sampleProduct.blue
			)
		)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
			.environmentObject(Shop())
//			.previewLayout(.fixed(width: 375, height: 812))
    }
}
