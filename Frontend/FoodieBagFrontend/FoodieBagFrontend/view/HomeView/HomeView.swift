//
//  MainView.swift
//  FoodieBagFrontend
//
//  Created by Heidi Albarazi on 18.11.23.
//

import SwiftUI

struct HomeView: View {
    var recipes = recipeData
    @State var showContent = false
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Recipes")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        
                        Text("1565 Recipes found")
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.leading, 60.0)
                
            }
        }
    }
}

#Preview {
    HomeView()
}
