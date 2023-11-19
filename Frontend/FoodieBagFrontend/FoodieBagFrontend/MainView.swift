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
                    Label("Videos", systemImage: "house")
                }
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "person")
                }
            AllergiesView()
                .tabItem {
                    Label("Home", systemImage: "person")
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
