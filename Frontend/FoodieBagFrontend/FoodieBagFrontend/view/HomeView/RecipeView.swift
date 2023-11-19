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
                Text("**Instructions**")
                    .font(.system(size: 36, weight: .semibold))
                    .padding()
                VStack(spacing: 0){
                    ForEach(instructionList, id: \.id){instruction in
                        InstructionRow(instruction:  instruction);
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

let instructionList = [
    Ingredient(emoji: "1. Prepare Ingredients", ingredient: "Chop the onion, mince the garlic, and grate the ginger. Chop the tomatoes and set aside.If you're using chicken, tofu, or any other protein, cut it into bite-sized pieces."),
    Ingredient(emoji: "2. Sauté Aromatics", ingredient: "Heat the vegetable oil in a large pan over medium heat. Add the chopped onions and sauté until they become translucent."),
    Ingredient(emoji: "3. Add Garlic and Ginger:", ingredient: "Add the minced garlic and grated ginger to the pan. Sauté for another 1-2 minutes until the garlic is fragrant."),
    Ingredient(emoji: "4. Add Tomatoes", ingredient: "Add the chopped tomatoes to the pan and cook until they are soft and the oil starts to separate."),
    Ingredient(emoji: "5. Add Spices", ingredient: "Add the curry powder, ground cumin, ground coriander, turmeric powder, and red chili powder to the pan. Stir well to combine with the tomato mixture."),
    Ingredient(emoji: "6. Cook Protein and Vegetables", ingredient: "Add the protein (chicken, tofu, or chickpeas) to the pan and cook until it's browned. Add the mixed vegetables and cook for a few minutes until they start to soften."),
    Ingredient(emoji: "7. Simmer in Coconut Milk", ingredient: "Pour in the coconut milk and stir the mixture well. Bring it to a simmer. Reduce the heat and let it simmer for about 15-20 minutes, allowing the flavors to meld."),
    Ingredient(emoji: "8. Season and Garnish:", ingredient: "Season with salt and pepper to taste. Garnish with fresh cilantro."),
    Ingredient(emoji: "9. Serve", ingredient: "Serve the curry masala over cooked rice or with your favorite bread (naan or roti)."),
]


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


struct InstructionRow: View {
    var instruction: Ingredient

    var body: some View {
        VStack(alignment: .leading) {
            Text(instruction.emoji)
                .font(.system(size: 28, weight: .semibold))
                .padding(.leading)
            Text(instruction.ingredient)
                .font(.body)
                .padding(.leading)
                .lineLimit(50)  // Ensures the text doesn't wrap to the next line
        }
        .padding()
    }
}


#Preview {
    RecipeView()
}
