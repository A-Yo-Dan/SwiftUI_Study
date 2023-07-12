//
//  ContentView.swift
//  Touchdown
//
//  Created by 정현우 on 2023/07/09.
//

import SwiftUI

struct ContentView: View {
	// MARK: - Properties
	@EnvironmentObject var shop: Shop
	
	// MARK: - Body
    var body: some View {
		ZStack {
			if shop.showingProduct == false && shop.selectedProduct == nil {
				VStack(spacing: 0) {
					NavigationBarView()
						.padding(.horizontal, 15)
						.padding(.bottom)
						.background(.white)
						.shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)
					
					ScrollView(.vertical, showsIndicators: false) {
						VStack(spacing: 0) {
							FeatureTabView()
								.frame(height: UIScreen.main.bounds.width / 1.475)
								.padding(.vertical, 5)
							
							CategoryGridView()
							
							TitleView(title: "Helmets")

							LazyVGrid(columns: gridLayout, spacing: 15) {
								ForEach(products) { product in
									ProductItemView(product: product)
										.onTapGesture {
											feedback.impactOccurred()
											withAnimation(.easeOut) {
												shop.selectedProduct = product
												shop.showingProduct = true
											}
										}
								}
							}
							.padding(15)
							
							TitleView(title: "Brands")
							
							BrandGridView()
							
							FooterView()
								.padding(.horizontal)
							
							
						}
					}
					
					
				} //: VStack
				.background(colorBackground.ignoresSafeArea(.all))
			} else {
				ProductDetailView()
			}
		}  //: ZStack
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
			.environmentObject(Shop())
    }
}
