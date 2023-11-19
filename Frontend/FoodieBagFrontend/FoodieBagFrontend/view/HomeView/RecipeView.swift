//
//  RecipeView.swift
//  FoodieBagFrontend
//
//  Created by Heidi Albarazi on 18.11.23.
//

import SwiftUI

struct RecipeView: View {


   var body: some View {
      return VStack(alignment: .leading) {
         Text("Recipes")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(30)
            .lineLimit(4)

         Spacer()

      }
   }
}

#Preview {
    RecipeView()
}
