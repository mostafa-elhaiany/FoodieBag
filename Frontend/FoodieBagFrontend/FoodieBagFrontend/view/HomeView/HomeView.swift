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
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30.0) {
                        ForEach(recipes) { item in
                            Button(action: { self.showContent.toggle() }) {
                                GeometryReader { geometry in
                                    RecipeView(title: item.name,
                                               image: item.image,
                                               color: item.color,
                                               shadowColor: item.shadowColor)
                                    .rotation3DEffect(Angle(degrees:
                                                                Double(geometry.frame(in: .global).minX - 30) / -40), axis: (x: 0, y: 10.0, z: 0))
                                    .sheet(isPresented: self.$showContent) { //ContentView()
                                    }
                                }
                                .frame(width: 246, height: 360)
                            }
                        }
                    }
                    .padding(.leading, 30)
                    .padding(.top, 30)
                    .padding(.bottom, 70)
                    Spacer()
                }
            }}
    }
}

#Preview {
    HomeView()
}
