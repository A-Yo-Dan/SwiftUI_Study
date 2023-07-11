//
//  TopPartDetailView.swift
//  Touchdown
//
//  Created by 정현우 on 2023/07/11.
//

import SwiftUI

struct TopPartDetailView: View {
	@EnvironmentObject var shop: Shop
	@State private var isAnimaing: Bool = false
	
    var body: some View {
		HStack(alignment: .center, spacing: 6) {
			VStack(alignment: .leading, spacing: 6) {
				Text("Price")
					.fontWeight(.semibold)
				
				Text(shop.selectedProduct?.formattedPrice ?? sampleProduct.formattedPrice)
					.font(.largeTitle)
					.fontWeight(.black)
					.scaleEffect(1.35, anchor: .leading)
			}
			.offset(y: isAnimaing ? -50 : -75)
			
			Spacer()
			
			Image(shop.selectedProduct?.image ?? sampleProduct.image)
				.resizable()
				.scaledToFit()
				.offset(y: isAnimaing ? 0: -35)
			
		} //: HStack
		.onAppear {
			withAnimation(.easeOut(duration: 0.75)) {
				isAnimaing.toggle()
			}
		}
    }
}

struct TopPartDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TopPartDetailView()
			.environmentObject(Shop())
    }
}
