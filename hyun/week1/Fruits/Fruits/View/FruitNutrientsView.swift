//
//  FruitNutrientsView.swift
//  Fruits
//
//  Created by 정현우 on 2023/07/05.
//

import SwiftUI

struct FruitNutrientsView: View {
	// MARK: - Properties
	var fruit: Fruit
	let nutrients: [String] = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]
	
	// MARK: - Body
    var body: some View {
		GroupBox {
			DisclosureGroup(content: {
				ForEach(0..<nutrients.count, id: \.self) { item in // id는 각 항목을 구분하기 위해
					Divider().padding(.vertical, 2)
					
					HStack {
						Group {
							Image(systemName: "info.circle")
							Text(nutrients[item])
						}
						.foregroundColor(fruit.gradientColors[1])
						.font(.system(.body).bold())
						
						Spacer(minLength: 25)
						
						Text(fruit.nutrition[item])
							.multilineTextAlignment(.trailing)
					}
				}
			}, label: {
				Text("Nutritional value per 100g")
			})
		}
    }
}

struct FruitNutrientsView_Previews: PreviewProvider {
    static var previews: some View {
        FruitNutrientsView(fruit: fruitsData[0])
			.preferredColorScheme(.dark)
			.previewLayout(.fixed(width: 375, height: 480))
			.padding()
    }
}
