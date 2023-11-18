//
//  AllergiesView.swift
//  FoodieBagFrontend
//
//  Created by Heidi Albarazi on 18.11.23.
//

import SwiftUI

struct AllergiesView: View {
    @State private var searchText = ""
    @State private var selectedItems: [FoodItem] = []
    var filteredItems: [FoodItem] {
        if searchText.isEmpty {
            return foodItems
        } else {
            return foodItems.filter { $0.text.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    AllergiesView()
}
