//
//  PreferencesCard.swift
//  FoodieBagFrontend
//
//  Created by Heidi Albarazi on 18.11.23.
//

import SwiftUI

let preferenceData: [PreferenceData] = [
    PreferenceData(imageName: "🥦", title: "Vegan", description: "No animal products, only plant-based foods."),
    PreferenceData(imageName: "🍅", title: "Vegetarian", description: "No meat, but may include other animal products like dairy and eggs."),
    PreferenceData(imageName: "🍗", title: "Non-Vegetarian", description: "Includes both meat and plant-based foods."),
    PreferenceData(imageName: "🍣", title: "Pescatarian", description: "A vegetarian diet that also includes fish and seafood."),
    PreferenceData(imageName: "🥩", title: "Carnivore", description: "Mainly consists of meat."),
    PreferenceData(imageName: "🥑", title: "Keto", description: "Low-carb, high-fat diet."),
    PreferenceData(imageName: "🍜", title: "Gluten-Free", description: "Avoids gluten-containing grains."),
    PreferenceData(imageName: "🍲", title: "Paleo", description: "Mimics the diet of early humans, focusing on whole foods."),
    PreferenceData(imageName: "🌱", title: "Plant-Based", description: "Diet centered around whole, plant-based foods."),
    PreferenceData(imageName: "🍧", title: "Dessert Lover", description: "Enjoys sweet treats and desserts."),
    PreferenceData(imageName: "➕", title: "Add your preference!", description: "Add anything you like to eat or do not"),
    // Add more food preferences as needed
]


struct PreferenceData {
    var imageName: String
    var title: String
    var description: String
}
