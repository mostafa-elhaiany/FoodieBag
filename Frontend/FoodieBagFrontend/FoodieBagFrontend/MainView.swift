//
//  MainView.swift
//  FoodieBagFrontend
//
//  Created by Heidi Albarazi on 18.11.23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            VideosView()
                .tabItem {
                    Label("Videos", systemImage: "arrowtriangle.right.square")
                }
            RecommendRecipeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            GamesView()
                .tabItem {
                    Label("Game", systemImage: "gamecontroller")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
        .tint(.green)
        .accentColor(.white) // Set the accent color to white
        .background(Color.white) // Set the background color to white

    }
}

#Preview {
    MainView()
}
