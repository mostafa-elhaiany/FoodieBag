//
//  RecipeView.swift
//  FoodieBagFrontend
//
//  Created by Heidi Albarazi on 19.11.23.
//

import SwiftUI

struct RecipeView: View {
    var body: some View {
        ScrollView(.vertical){
            VStack(alignment: .leading){
                Text("**Ingredients**")
                    .font(.system(size: 36, weight: .semibold))
                    .padding()
                Spacer()
                VStack(spacing: 0){
                    ForEach(ingredientsList, id: \.id){ingredient in
                        IngredientsRow(ingredient: ingredient);
                    }
                }
            }
            
        }
    }
}

struct Ingredient: Identifiable {
    var id = UUID()
    let emoji: String
    let ingredient: String
}

let ingredientsList = [
    Ingredient(emoji: "🍅", ingredient: "3 Tomatoes"),
    Ingredient(emoji: "🥄", ingredient: "2 tablespoons vegetable oil"),
    Ingredient(emoji: "🧅", ingredient: "1 large onion, finely chopped"),
    Ingredient(emoji: "🧄", ingredient: "3 cloves garlic, minced"),
    Ingredient(emoji: "🧅", ingredient: "1 tablespoon ginger, grated"),
    Ingredient(emoji: "🍅", ingredient: "2 tomatoes, chopped"),
    Ingredient(emoji: "🥕", ingredient: "1 cup mixed vegetables (such as peas, carrots, and potatoes)"),
    Ingredient(emoji: "🍗", ingredient: "1 cup protein of your choice (chicken, tofu, or chickpeas work well)"),
    Ingredient(emoji: "🍛", ingredient: "2 tablespoons curry powder"),
    Ingredient(emoji: "🌿", ingredient: "1 teaspoon ground cumin"),
    Ingredient(emoji: "🌿", ingredient: "1 teaspoon ground coriander"),
    Ingredient(emoji: "🌕", ingredient: "1/2 teaspoon turmeric powder"),
    Ingredient(emoji: "🌶️", ingredient: "1/2 teaspoon red chili powder (adjust to taste)"),
    Ingredient(emoji: "🥥", ingredient: "1 cup coconut milk"),
    Ingredient(emoji: "🧂", ingredient: "Salt and pepper to taste"),
    Ingredient(emoji: "🌿", ingredient: "Fresh cilantro for garnish"),
]


struct IngredientsRow: View {
    var ingredient: Ingredient
    var sustainabilityScore: Int = Int.random(in: 1...100)
    
    var body: some View {
        HStack {
            Text(ingredient.emoji)
                .font(.largeTitle)
            
            Text(ingredient.ingredient)
                .font(.body)
                .multilineTextAlignment(.leading)
                .lineLimit(3)  // Ensures the text doesn't wrap to the next line
            
            Spacer()
            
            Text("\(sustainabilityScore) SP")
                .font(.callout)
                .padding()
                .background(Color.green.opacity(0.2))
                .clipShape(Capsule())
        }
        .padding()
    }
}


#Preview {
    RecipeView()
}
