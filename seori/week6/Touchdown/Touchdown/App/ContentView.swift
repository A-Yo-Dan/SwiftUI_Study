//
//  ContentView.swift
//  Touchdown
//
//  Created by 서은수 on 2023/08/07.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    
    let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
    
    @EnvironmentObject var shop: Shop
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            if shop.showingProduct == false && shop.selectedProduct == nil {
                VStack(spacing: 0) {
                    NavigationBarView()
                        .padding(.horizontal, 15)
                        .padding(.bottom)
                        .padding(.top, windowScene?.windows.first?.safeAreaInsets.top) // safeArea의 상단 inset 만큼 top에 패딩을 주겠다 -> 자연스럽게 노치 부분을 피할 수 있게 됨!
                        .background(.white)
                        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)
                    
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack(spacing: 0) {
                            FeaturedTabView()
                                .frame(minHeight: 256)
                                .padding(.vertical, 10)
                            
                            CategoryGridView()
                            
                            TitleView(title: "Helmets")
                            
                            // 수직 그리드
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
                    })
                }
                .background(colorBackground.ignoresSafeArea(.all, edges: .all))
            } else {
                ProductDetailView()
            }
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Shop()) // 프리뷰한테는 따로 또 알려줘야 함
    }
}
