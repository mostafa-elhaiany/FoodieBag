//
//  Allergens.swift
//  FoodieBagFrontend
//
//  Created by Heidi Albarazi on 18.11.23.
//

import SwiftUI

struct FoodItem: Identifiable, Hashable {
    var id = UUID().uuidString
    var emoji: String
    var text: String
    var size: CGFloat = 0

}


let foodItems: [FoodItem] = [
    // Vegetables
    FoodItem(emoji: "🥦", text: "Broccoli"),
    FoodItem(emoji: "🥕", text: "Carrot"),
    FoodItem(emoji: "🍅", text: "Tomato"),
    FoodItem(emoji: "🥒", text: "Cucumber"),
    FoodItem(emoji: "🫑", text: "Bell Pepper"),
    FoodItem(emoji: "🌽", text: "Corn"),
    FoodItem(emoji: "🍆", text: "Eggplant"),
    FoodItem(emoji: "🍠", text: "Sweet Potato"),
    FoodItem(emoji: "🥔", text: "Potato"),
    FoodItem(emoji: "🥬", text: "Kale"),

    // Fruits
    FoodItem(emoji: "🍎", text: "Apple"),
    FoodItem(emoji: "🍌", text: "Banana"),
    FoodItem(emoji: "🍊", text: "Orange"),
    FoodItem(emoji: "🍓", text: "Strawberry"),
    FoodItem(emoji: "🍇", text: "Grape"),
    FoodItem(emoji: "🍍", text: "Pineapple"),
    FoodItem(emoji: "🥭", text: "Mango"),
    FoodItem(emoji: "🍑", text: "Peach"),
    FoodItem(emoji: "🍈", text: "Melon"),
    FoodItem(emoji: "🍒", text: "Cherry"),

    // Simplified Food Preferences
    FoodItem(emoji: "🍲", text: "Soup"),
    FoodItem(emoji: "🍜", text: "Noodles"),
    FoodItem(emoji: "🍛", text: "Curry"),
    FoodItem(emoji: "🥪", text: "Sandwich"),
    FoodItem(emoji: "🥤", text: "Beverage"),
    FoodItem(emoji: "🍰", text: "Cake"),
    FoodItem(emoji: "🍯", text: "Honey"),
    FoodItem(emoji: "🍹", text: "Mocktail"),

    // Additional Foods
    FoodItem(emoji: "🍕", text: "Pizza"),
    FoodItem(emoji: "🍝", text: "Pasta"),
    FoodItem(emoji: "🍔", text: "Burger"),
    FoodItem(emoji: "🍟", text: "French Fries"),
    FoodItem(emoji: "🌮", text: "Taco"),
    FoodItem(emoji: "🍣", text: "Sushi"),
    FoodItem(emoji: "🍤", text: "Shrimp"),
    FoodItem(emoji: "🥞", text: "Pancake"),
    FoodItem(emoji: "🍦", text: "Ice Cream"),
    FoodItem(emoji: "🍧", text: "Shaved Ice"),

    // More Fruits
    FoodItem(emoji: "🍆", text: "Eggplant"),
    FoodItem(emoji: "🌰", text: "Chestnut"),
    FoodItem(emoji: "🍋", text: "Lemon"),
    FoodItem(emoji: "🥥", text: "Coconut"),
    FoodItem(emoji: "🍏", text: "Green Apple"),

    // More Vegetables
    FoodItem(emoji: "🌶", text: "Chili Pepper"),
    FoodItem(emoji: "🍄", text: "Mushroom"),
    FoodItem(emoji: "🥑", text: "Avocado"),
    FoodItem(emoji: "🍖", text: "Meat on Bone"),
    FoodItem(emoji: "🍗", text: "Chicken Leg"),

    // More Food Preferences
    FoodItem(emoji: "🍩", text: "Donut"),
    FoodItem(emoji: "🍓", text: "Strawberry"),
    FoodItem(emoji: "🥧", text: "Pie"),
    FoodItem(emoji: "🧀", text: "Cheese"),
    FoodItem(emoji: "🍚", text: "Rice"),
    FoodItem(emoji: "🍌", text: "Banana"),
    FoodItem(emoji: "🍳", text: "Cooking"),
    FoodItem(emoji: "🍈", text: "Melon"),
    FoodItem(emoji: "🥚", text: "Egg"),

    // More Simplified Food Preferences
    FoodItem(emoji: "🍻", text: "Beer"),
    FoodItem(emoji: "🍹", text: "Cocktail"),
    FoodItem(emoji: "🍷", text: "Wine"),
    FoodItem(emoji: "🍾", text: "Champagne"),
    FoodItem(emoji: "☕️", text: "Coffee"),
    FoodItem(emoji: "🍵", text: "Tea"),
    FoodItem(emoji: "🥤", text: "Beverage"),
    FoodItem(emoji: "🧃", text: "Juice"),

    // More Additional Foods
    FoodItem(emoji: "🥐", text: "Croissant"),
    FoodItem(emoji: "🍔", text: "Hamburger"),
    FoodItem(emoji: "🍖", text: "Meat"),
    FoodItem(emoji: "🍤", text: "Shrimp"),
    FoodItem(emoji: "🍟", text: "French Fries"),
    FoodItem(emoji: "🍛", text: "Curry Rice"),
    FoodItem(emoji: "🍜", text: "Steaming Bowl"),

    // More Beverages
    FoodItem(emoji: "🥛", text: "Milk"),
    FoodItem(emoji: "🍼", text: "Baby Bottle"),
    FoodItem(emoji: "🥂", text: "Clinking Glasses"),
    FoodItem(emoji: "🍻", text: "Beer Mugs"),
    FoodItem(emoji: "🍺", text: "Beer Mug"),
    FoodItem(emoji: "🥃", text: "Tumbler Glass"),
    FoodItem(emoji: "🍸", text: "Martini Glass"),
    FoodItem(emoji: "🍹", text: "Tropical Drink"),

    // More Desserts
    FoodItem(emoji: "🍨", text: "Ice Cream"),
    FoodItem(emoji: "🍦", text: "Soft Ice Cream"),
    FoodItem(emoji: "🍰", text: "Shortcake"),
    FoodItem(emoji: "🎂", text: "Birthday Cake"),
    FoodItem(emoji: "🧁", text: "Cupcake"),
    FoodItem(emoji: "🍮", text: "Flan"),
    FoodItem(emoji: "🍭", text: "Lollipop"),
    FoodItem(emoji: "🍬", text: "Candy"),
    FoodItem(emoji: "🍫", text: "Chocolate Bar"),
    FoodItem(emoji: "🍩", text: "Donut"),

    // More Sweets
    FoodItem(emoji: "🍪", text: "Cookie"),
    FoodItem(emoji: "🌰", text: "Chestnut"),
    FoodItem(emoji: "🥜", text: "Peanuts"),
    FoodItem(emoji: "🍯", text: "Honey Pot"),
    FoodItem(emoji: "🍭", text: "Lollipop"),

    // More Cakes
    FoodItem(emoji: "🧁", text: "Cupcake"),
    FoodItem(emoji: "🎂", text: "Birthday Cake"),
    FoodItem(emoji: "🍰", text: "Shortcake"),
    FoodItem(emoji: "🍮", text: "Flan"),
    FoodItem(emoji: "🍩", text: "Donut"),
    FoodItem(emoji: "🍪", text: "Cookie"),

    // More Seafood
    FoodItem(emoji: "🦀", text: "Crab"),
    FoodItem(emoji: "🦐", text: "Shrimp"),
    FoodItem(emoji: "🦑", text: "Squid"),
    FoodItem(emoji: "🐙", text: "Octopus"),

    // More Meat
    FoodItem(emoji: "🍖", text: "Meat on Bone"),
    FoodItem(emoji: "🍗", text: "Chicken Leg"),
    FoodItem(emoji: "🥩", text: "Cut of Meat"),
    FoodItem(emoji: "🥓", text: "Bacon"),

    // More Fast Food
    FoodItem(emoji: "🍔", text: "Hamburger"),
    FoodItem(emoji: "🍟", text: "French Fries"),
    FoodItem(emoji: "🌭", text: "Hot Dog"),

    // More Asian Cuisine
    FoodItem(emoji: "🍱", text: "Bento Box"),
    FoodItem(emoji: "🍲", text: "Stew"),

    // More Mexican Cuisine
    FoodItem(emoji: "🌮", text: "Taco"),
    FoodItem(emoji: "🌯", text: "Burrito"),

    // More Italian Cuisine
    FoodItem(emoji: "🍝", text: "Spaghetti"),
    FoodItem(emoji: "🍕", text: "Pizza"),
    FoodItem(emoji: "🍅", text: "Tomato"),

    // More Japanese Cuisine
    FoodItem(emoji: "🍜", text: "Steaming Bowl"),
    FoodItem(emoji: "🍣", text: "Sushi"),

    // More Chinese Cuisine
    FoodItem(emoji: "🍚", text: "Cooked Rice"),
    FoodItem(emoji: "🥢", text: "Chopsticks"),

    // More Indian Cuisine
    FoodItem(emoji: "🍛", text: "Curry Rice"),
    FoodItem(emoji: "🍲", text: "Stew"),

    // More Middle Eastern Cuisine
    FoodItem(emoji: "🥙", text: "Stuffed Flatbread"),
    FoodItem(emoji: "🍆", text: "Eggplant"),

    // More Desserts
    FoodItem(emoji: "🧁", text: "Cupcake"),
    FoodItem(emoji: "🍰", text: "Shortcake"),
    FoodItem(emoji: "🍮", text: "Flan"),
    FoodItem(emoji: "🍦", text: "Ice Cream"),

    // More Beverages
    FoodItem(emoji: "☕️", text: "Coffee"),
    FoodItem(emoji: "🍵", text: "Tea"),
    FoodItem(emoji: "🍹", text: "Tropical Drink"),
    FoodItem(emoji: "🍷", text: "Wine"),

    // More Breakfast Items
    FoodItem(emoji: "🥞", text: "Pancake"),
    FoodItem(emoji: "🥓", text: "Bacon"),
    FoodItem(emoji: "🍳", text: "Egg"),

    // More Sweets
    FoodItem(emoji: "🍭", text: "Lollipop"),
    FoodItem(emoji: "🍬", text: "Candy"),
    FoodItem(emoji: "🍫", text: "Chocolate Bar"),

    // More Snacks
    FoodItem(emoji: "🥨", text: "Pretzel"),
    FoodItem(emoji: "🍿", text: "Popcorn"),
    FoodItem(emoji: "🍩", text: "Donut"),

    // More International Cuisine
    FoodItem(emoji: "🍱", text: "Bento Box"),
    FoodItem(emoji: "🍝", text: "Spaghetti"),
    FoodItem(emoji: "🍕", text: "Pizza"),
    FoodItem(emoji: "🌮", text: "Taco"),

    // More Holiday Foods
    FoodItem(emoji: "🦃", text: "Turkey"),
    FoodItem(emoji: "🎄", text: "Christmas Tree"),
    FoodItem(emoji: "🎂", text: "Birthday Cake"),

    // More Miscellaneous Foods
    FoodItem(emoji: "🍜", text: "Noodles")
    ]



func removeDuplicates(from array: [FoodItem]) -> [FoodItem] {
    var uniqueItems = [FoodItem]()
    var uniqueSet = Set<String>()

    for item in array {
        if uniqueSet.insert(item.text).inserted {
            uniqueItems.append(item)
        }
    }

    return uniqueItems
}


let uniqueFoodItems = removeDuplicates(from: foodItems)


extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.width
}

extension String{
    func getSize() -> CGFloat{
        let font = UIFont.systemFont(ofSize: 16)
        let attributes = [NSAttributedString.Key.font: font]
        let size = (self as NSString).size(withAttributes: attributes)
        return size.width
    }
}
