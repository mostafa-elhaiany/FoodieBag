//
//  ContentView.swift
//  FoodieBagFrontend
//
//  Created by Heidi Albarazi on 18.11.23.
//
import SwiftUI

struct ContentView: View {

   @State var show = false
   @State var viewState = CGSize.zero

   var body: some View {
      ZStack {
         BlurView(style: .systemMaterial)

         CardView()
            .background(show ? Color.red : Color("background9"))
            .cornerRadius(10)
            .shadow(radius: 20)
            .offset(x: 0, y: show ? -400 : -40)
            .scaleEffect(0.85)
            .rotationEffect(Angle(degrees: show ? 15 : 0))
            .blendMode(.hardLight)
            .offset(x: viewState.width, y: viewState.height)

         CardView()
            .background(show ? Color("background5") : Color("background8"))
            .cornerRadius(10)
            .shadow(radius: 20)
            .offset(x: 0, y: show ? -200 : -20)
            .scaleEffect(0.9)
            .rotationEffect(Angle(degrees: show ? 10 : 0))
            .blendMode(.hardLight)
            .offset(x: viewState.width, y: viewState.height)
        SecondARViewController()
      }
   }
}

#if DEBUG
struct MapContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
#endif

struct CardView: View {
   var body: some View {
      return VStack {
         Text("Card Back")
      }
      .frame(width: 340.0, height: 220.0)
   }
}
