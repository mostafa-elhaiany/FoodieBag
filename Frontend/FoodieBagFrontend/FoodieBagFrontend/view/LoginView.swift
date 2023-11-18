//
//  LoginView.swift
//  FoodieBagFrontend
//
//  Created by Heidi Albarazi on 18.11.23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""


    var body: some View {
        
        VStack{
            TextField("E-Mail", text: self.$email)

                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .padding()
            SecureField("Password", text: self.$password)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .padding()
            

        }
        
        .padding()
        
    }
}

#Preview {
    LoginView()
}
