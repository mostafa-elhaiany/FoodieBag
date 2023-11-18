//
//  P266_ViscosityCanvas.swift
//
//
//  Created by jasu on 2022/10/17.
//  Copyright (c) 2022 jasu All rights reserved.
//

import SwiftUI

public struct P266_ViscosityCanvas: View {

    @State private var scale1: CGFloat = 1
    @State private var scale2: CGFloat = 1
    @State private var isFillMode: Bool = true
    @State private var titleOpacity: Double = 1.0

    public init() {}
    public var body: some View {
        ZStack {
            // Title in bold
            Text("Let's get to know you!")
                .font(.system(size: 128))
                .fontWeight(.black)
                .padding(.top, 1)
                .opacity(titleOpacity)  // Apply opacity based on the titleOpacity state

            viscosityView(color: Color(rgb: 0xD2D90B), scale: $scale1)
            viscosityView(color: Color(rgb: 0xF2EB79), scale: $scale2)
                .blendMode(.screen)

            VStack(spacing: 0) {
                cardView()
                    .frame(height: UIScreen.main.bounds.height * 0.7) // Adjust the card height as needed

                HStack {
                    Spacer()

                    Button(action: {
                        // Add your save action here
                        print("Save button tapped")
                    }) {
                        Text("Save")
                            .foregroundColor(.white)
                            .padding()
                            .background( Color(red: 0.827, green: 0.847, blue: 0.043)
)
                            .cornerRadius(15)
                            .padding()
                    }
                    .opacity(showCard ? 1.0 : 0.0)
                    .animation(.easeIn(duration: 0.5))
                    .padding(.trailing, 20) // Adjust the trailing space
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            // Animate the card view and title opacity changes over 4 seconds
            withAnimation(Animation.easeIn(duration: 5)) {
                showCard = true
                titleOpacity = 0.0
            }
        }
    }




    
    private func viscosityView(color: Color, scale: Binding<CGFloat>) -> some View {
        GeometryReader { geo in
            if isFillMode {
                ViscosityCanvas(color: color) {
                    circle(cnavasSize: geo.size, scale: scale)
                }
            } else {
                ViscosityCanvas(color: color, thresholdMin: 0.5, thresholdMax: 0.7) {
                    circle(cnavasSize: geo.size, scale: scale)
                }
            }
        }
    }
    
    @ViewBuilder
    private func circle(cnavasSize: CGSize, scale: Binding<CGFloat>) -> some View {
        let min = min(cnavasSize.width, cnavasSize.height) * 0.09
        let width: CGFloat = .random(in: min...(min * 2.6))
        let height: CGFloat = .random(in: min...(min * 2.6))
        
        ForEach(0..<60, id: \.self) { index in
            Circle()
                .frame(width: width, height: height)
                .scaleEffect(scale.wrappedValue * .random(in: 0.1..<1.5))
                .animation(Animation.easeInOut(duration: 3)
                    .repeatForever()
                    .speed(.random(in: 0.1...0.2))
                    .delay(.random(in: 0...2)), value: scale.wrappedValue)
                .position(CGPoint(x: .random(in: 0..<cnavasSize.width),
                                  y: .random(in: 0..<cnavasSize.height)))
                .tag(index)
        }
        .onAppear {
            scale.wrappedValue = scale.wrappedValue == 1.2 ? 1.0 : 1.2
        }
    }

    @State private var scrollToIndex = 0
    @State private var showCard = false
    @State private var buttonStates = Array(repeating: false, count: 20)
    let commonAllergens = ["Milk", "Egg", "Peanut", "Tree Nuts", "Fish", "Shellfish", "Soy", "Wheat"]


    // Custom ToggleStyle to customize the appearance of the buttons
    struct CustomButtonToggleStyle: ToggleStyle {
        func makeBody(configuration: Configuration) -> some View {
            Button(action: {
                configuration.isOn.toggle()
            }) {
                configuration.label
                    .background(configuration.isOn ? Color.blue : Color.gray.opacity(0.1))
                    .cornerRadius(15)
            }
        }
    }

    private func cardView() -> some View {
        GeometryReader { geometry in
            VStack(spacing: 10) {
                
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(0..<rowCount) { rowIndex in
                            if rowIndex == scrollToIndex {
                                ContentView()
                            }
                        }
                    }
                }
               
             

               
            }
            .background(Color.white.opacity(0.9))
            .cornerRadius(10)
            .padding()
            .opacity(showCard ? 1.0 : 0.0)
            .onAppear {
                withAnimation(Animation.easeIn(duration: 4)) {
                    showCard = true
                }
            }
        }
    }




   
    // Set the number of rows (excluding the button row)
    private let rowCount = 5  // Adjust as needed



    struct CheckmarkView: View {
        var isSelected: Bool

        var body: some View {
            Image(systemName: isSelected ? "checkmark" : "circle")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(isSelected ? .green : .gray)
        }
    }

    struct AllergenRowView: View {
        let title: String
        let allergens: [String]

        @State private var selectedAllergens: Set<String> = []

        var body: some View {
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 5)

                ForEach(allergens, id: \.self) { allergen in
                    HStack {
                        Text(allergen)
                            .foregroundColor(.primary)
                            .padding()
                            
                            .cornerRadius(15)

                        Spacer()

                        CheckmarkView(isSelected: selectedAllergens.contains(allergen))
                            .onTapGesture {
                                toggleAllergen(allergen)
                            }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        toggleAllergen(allergen)
                    }
                    .padding(.horizontal)
                }
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(15)
        }

        private func toggleAllergen(_ allergen: String) {
            if selectedAllergens.contains(allergen) {
                selectedAllergens.remove(allergen)
            } else {
                selectedAllergens.insert(allergen)
            }
        }
    }

    struct AllergenInputRowView: View {
        let title: String
        @State private var userInput: String = ""

        var body: some View {
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 5)

                TextField("Enter some food ", text: $userInput)
                    .padding()
                    .textFieldStyle(.plain)
                    .background(Color.clear) // Set background to clear
                    
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(15)
        }
    }








    struct ContentView: View {
        let commonAllergens = ["Milk", "Egg", "Peanut", "Tree Nuts", "Fish", "Shellfish", "Soy", "Wheat"]
        let diets = [
            "Vegetarian",
            "Vegan",
            "Keto",
            "Paleo",
            "Mediterranean",
            "Gluten-Free",
            "Low-Carb",
            "Low-Fat",
            "Pescatarian",
            "Flexitarian"
        ]


        var body: some View {
            VStack(spacing: 20) {
                AllergenRowView(title: "Im allergic against ", allergens: commonAllergens )
                AllergenRowView(title: "Prefered Diets ", allergens: diets )
               AllergenInputRowView(title: "I love these ingredients")
                AllergenInputRowView(title: "I hate these ingredients")
                
                
                // Add more rows as needed
            }
            .padding()
        }
    }




}


fileprivate
struct ViscosityCanvas<Symbols: View> : View {
    
    let color: Color
    let thresholdMin: CGFloat
    let thresholdMax: CGFloat?
    let radius: CGFloat
    let symbols: () -> Symbols
    
    var body: some View {
        Canvas { context, size in
            if let thresholdMax = thresholdMax {
                context.addFilter(.alphaThreshold(min: thresholdMin, max: thresholdMax, color: color))
            } else {
                context.addFilter(.alphaThreshold(min: thresholdMin, color: color))
            }
            context.addFilter(.blur(radius: 12))
            context.drawLayer { ctx in
                for index in 0..<60 {
                    if let view = context.resolveSymbol(id: index) {
                        ctx.draw(view, at: CGPoint(x: size.width / 2, y: size.height / 2))
                    }
                }
            }
        } symbols: {
            symbols()
        }
    }
    
    init(color: Color, thresholdMin: CGFloat = 0.5, thresholdMax: CGFloat? = nil, radius: CGFloat = 12, @ViewBuilder symbols: @escaping () -> Symbols) {
        self.color = color
        self.thresholdMin = thresholdMin
        self.thresholdMax = thresholdMax
        self.radius = radius
        self.symbols = symbols
    }
}

struct P266_ViscosityCanvas_Previews: PreviewProvider {
    static var previews: some View {
        P266_ViscosityCanvas()
    }
}

extension Color {
    init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0)
   }

    init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
