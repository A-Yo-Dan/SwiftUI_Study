//
//  NavigationBarDetailView.swift
//  Touchdown
//
//  Created by 정현우 on 2023/07/10.
//

import SwiftUI

struct NavigationBarDetailView: View {
	@EnvironmentObject var shop: Shop
	
    var body: some View {
		HStack {
			Button(action: {
				feedback.impactOccurred()
				withAnimation(.easeIn) {
					shop.selectedProduct = nil
					shop.showingProduct = false
				}
			}, label: {
				Image(systemName: "chevron.left")
					.font(.title)
					.foregroundColor(.white)
			})
			
			Spacer()
			
			Button(action: {
				
			}, label: {
				Image(systemName: "cart")
					.font(.title)
					.foregroundColor(.white)
			})
		}
    }
}

struct NavigationBarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarDetailView()
			.environmentObject(Shop())
			.previewLayout(.sizeThatFits)
			.padding()
			.background(Color.gray)
			
    }
}
