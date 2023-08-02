//
//  RecipeRatingView.swift
//  Avocados
//
//  Created by 정현우 on 2023/07/28.
//

import SwiftUI

struct RecipeRatingView: View {
	
	var recipe: Recipe
	
    var body: some View {
		HStack {
			ForEach(1...(recipe.rating), id: \.self) { item in
				Image(systemName: "star.fill")
					.font(.body)
				.foregroundColor(.yellow)
			}
		}
    }
}

struct RecipeRatingView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRatingView(recipe: recipesData[0])
    }
}
