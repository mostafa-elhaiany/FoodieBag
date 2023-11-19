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
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8656061888, green: 0.9519659877, blue: 0.818531692, alpha: 1)), Color(#colorLiteral(red: 0.9571250081, green: 0.9806895852, blue: 0.9415946603, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)

            VStack {
                LottieView(name: "loginLottie")
                    .frame(width: 300)
                
                TextField("E-Mail", text: self.$email)
                    .padding()
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .background(.white)
                    .shadow(radius: 10)
                

                SecureField("Password", text: self.$password)
                    .padding()
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .background(.white)
                    .shadow(radius: 10)
                Spacer()
                
                
            }
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
