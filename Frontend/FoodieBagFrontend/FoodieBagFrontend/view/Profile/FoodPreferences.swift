//
//  FoodPreferences.swift
//  FoodieBagFrontend
//
//  Created by Heidi Albarazi on 18.11.23.
//

import SwiftUI

struct FoodPreferences: View {
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(preferenceData.indices) { index in
                            GeometryReader { geometry in
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8656061888, green: 0.9519659877, blue: 0.818531692, alpha: 1)), Color(#colorLiteral(red: 0.9571250081, green: 0.9806895852, blue: 0.9415946603, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                    
                                    .rotation3DEffect(
                                        Angle(
                                            degrees: Double((geometry.frame(in: .global).minX - 20) / -20)
                                        ),
                                        axis: (x: 0, y: 1, z: 0),
                                        anchor: .center,
                                        anchorZ: 0.0,
                                        perspective: 1.0
                                    )
                                    .overlay(
                                        VStack {
                                            Text(preferenceData[index].imageName)
                                                                                        .font(.system(size: 80))


                                            Text(preferenceData[index].title)
                                                .font(.headline)

                                            Text(preferenceData[index].description)
                                                .font(.caption)
                                                .multilineTextAlignment(.center)
                                        }
                                        .padding()
                                    )
                            }
                            .frame(width: 200, height: 200)
                            
                        }
                    }
                    .padding()
                }
    }
}

#Preview {
    FoodPreferences()
}
