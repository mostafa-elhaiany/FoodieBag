//
//  Recipe.swift
//  FoodieBagFrontend
//
//  Created by Heidi Albarazi on 18.11.23.
//

import Foundation
import SwiftUI

struct RecipeCard: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var image: String
    var color: Color
    var shadowColor: Color
}


let recipeData = [
   RecipeCard(name: "Enchilladas",
              description: "testtest",
          image: "Illustration1",
          color: Color("blue"),
          shadowColor: Color("blue")),
   RecipeCard(name: "Spagetti Bolognese",
              description: "testtest",
          image: "Illustration2",
          color: Color("red"),
          shadowColor: Color("red")),
   RecipeCard(name: "French Fries",
              description: "testtest",
          image: "Illustration3",
          color: Color("green"),
          shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
   RecipeCard(name: "Salad",
              description: "testtest",
          image: "Illustration4",
          color: Color("green"),
          shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
   RecipeCard(name: "Flutter for Designers",
              description: "testtest",
          image: "Illustration5",
          color: Color("green"),
          shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
]
