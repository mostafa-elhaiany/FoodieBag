//
//  ProfileView.swift
//  FoodieBagFrontend
//
//  Created by Heidi Albarazi on 18.11.23.
//

import SwiftUI

struct ProfileView: View {
    @State private var searchText = ""

    var body: some View {
        
        VStack{
            HStack{
                Image("profilepic1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 1))
                    .shadow(radius: 3)
                
                VStack{
                    Text("Welcome back,")
                        .font(.subheadline)
                        .opacity(0.6)
                    Text("Sarah Baker")
                        
                }
                Spacer()
                Image(systemName: "gear")
                    .padding()
            }.padding(.horizontal)
            
            
            Text("Food Preferences")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding()
            FoodPreferences()
            Spacer()
            
        }
        
    }
}

#Preview {
    ProfileView()
}
