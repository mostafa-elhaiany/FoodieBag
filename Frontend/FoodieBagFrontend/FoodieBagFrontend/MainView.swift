//
//  ContentView.swift
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
            HomeView()
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
        .tint(.black)
    }
}

#Preview {
    MainView()
}
