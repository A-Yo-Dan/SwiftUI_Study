//
//  RecipeCookingView.swift
//  Avocados
//
//  Created by 정현우 on 2023/07/28.
//

import SwiftUI

struct RecipeCookingView: View {
	var recipe: Recipe
	
    var body: some View {
		HStack(alignment: .center, spacing: 12) {
			HStack(alignment: .center, spacing: 2) {
				Image(systemName: "person.2")
				Text("Serves: \(recipe.serves)")
			}
			
			HStack(alignment: .center, spacing: 2) {
				Image(systemName: "clock")
				Text("Prep: \(recipe.preparation)")
			}
			
			HStack(alignment: .center, spacing: 2) {
				Image(systemName: "flame")
				Text("Cooking: \(recipe.cooking)")
			}
		}
		.font(.footnote)
		.foregroundColor(.gray)
    }
}

struct RecipeCookingView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCookingView(recipe: recipesData[0])
    }
}
