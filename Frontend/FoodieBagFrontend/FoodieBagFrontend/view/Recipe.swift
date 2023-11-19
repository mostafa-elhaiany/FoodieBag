//
//  Recipe.swift
//  FoodieBagFrontend
//
//  Created by Heidi Albarazi on 18.11.23.
//

import Foundation
import SwiftUI

struct Recipe: Identifiable {
    var id = UUID()
    var name: String
    var category: String
    var image: String
    var color: Color
    var prize: Int
}


let recipeList = [
    Recipe(name: "Curry Masala", category: "🍅 vegetarian", image: "currymasala", color: .green, prize: 10),
    Recipe(name: "Greek Salad", category: "🥦 vegan", image: "salad1", color: .teal, prize: 7),
    Recipe(name: "Healthy Salad", category: "🥑 Keto", image: "salad2", color: .blue, prize: 13),
    Recipe(name: "Curry Masala", category: "🍅 vegetarian", image: "currymasala", color: .yellow, prize: 5),
    Recipe(name: "Healthy Salad", category: "🥑 Keto", image: "salad2", color: .blue, prize: 14),
    Recipe(name: "Greek Salad", category: "🥦 vegan", image: "salad1", color: .brown, prize: 11),
    Recipe(name: "Healthy Salad", category: "🥑 Keto", image: "salad2", color: .pink, prize: 9),
    Recipe(name: "Curry Masala", category: "🍅 vegetarian", image: "currymasala", color: .green, prize: 8),
    Recipe(name: "Greek Salad", category: "🥦 vegan", image: "salad1", color: .red, prize: 6),
]
