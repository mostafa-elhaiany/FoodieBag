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
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
    MainView()
}
