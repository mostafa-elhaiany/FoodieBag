//
//  RecommendRecipeView.swift
//  FoodieBagFrontend
//
//  Created by Heidi Albarazi on 19.11.23.
//

import SwiftUI


struct RecommendRecipeView: View {
    
    @State var selectedCategory = ""
    @State private var isImagePickerPresented = false
    @State private var takenPhoto: UIImage?
    @State var showRecipeView = false

    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    HStack{
                        Text("Cook with the best **Ingredients** and **Recipees**")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        Spacer()
                        Image(systemName: "camera.on.rectangle")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 70, height: 90)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                            .onTapGesture {
                                                            isImagePickerPresented.toggle()
                                                        }
                                                        .sheet(isPresented: $isImagePickerPresented) {
                                                            ImagePickerView { image in
                                                                takenPhoto = image
                                                            }
                                                        }
                    }.padding(30)
                    
                    // Category Row
                    CategoryRow
                    
                    
                    
                    // CollectionView
                    HStack{
                        Text("**Recipe** Collection")
                            .font(.system(size: 24))
                        Spacer()
                        NavigationLink(destination: RecipeView()) {
                            Image(systemName: "arrow.right")
                                .imageScale(.large)
                                .foregroundColor(.black)
                        }

                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    
                    
                    
                    // Recipe List
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(recipeList, id: \.id ){ item in
                                RecipeCardView(recipe: item)
                                
                            }
                        }
                    }
                    
                }
                .navigationBarTitle("Recipes", displayMode: .inline)
                            .navigationBarHidden(true) // Hide navigation bar when not needed
                            .background(NavigationLink(destination: ProfileView(), isActive: Binding.constant(takenPhoto != nil)) {
                                EmptyView()
                            })
            }
        }
    }
    
    
    var CategoryRow: some View {
        HStack{
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    Button{
                        
                    } label: {
                        HStack{
                            
                            Text("All")
                        }
                        .padding()
                        .background(selectedCategory == "All" ? .green : .gray.opacity(0.1))
                        .foregroundColor(.black)
                        .clipShape(Capsule())
                        
                    }
                    ForEach(preferenceData, id: \.id){ item in
                        Button{
                            selectedCategory = item.title
                        } label: {
                            HStack{
                                if item.title != "All" {
                                    Text(item.imageName)
                                }
                                Text(item.title)
                            }
                            .padding(20)
                            .background(selectedCategory == item.title ? .green : .gray.opacity(0.1))
                            .foregroundColor(.black)
                            .clipShape(Capsule())
                            
                        }
                        
                    }
                }
            }
        }
        .padding(.horizontal, 30)
    }
}


// RecipeCardView
struct RecipeCardView: View {
    var recipe: Recipe
    var body: some View {
        ZStack{
            Image(recipe.image)
                .resizable()
                .scaledToFit()
                .padding(.trailing, -200)
                .rotationEffect(Angle(degrees: 30))

            VStack(alignment: .leading, content: {
                Text("\(recipe.name)")
                    .font(.system(size: 36, weight: .semibold))
                    .frame(width: 140)
                    .padding()
                
                Text("\(recipe.category)")
                    .font(.callout)
                    .padding()
                    .background(.white.opacity(0.5))
                    .clipShape(Capsule())
                Spacer()
                HStack{
                    Text("\(recipe.prize).00€")
                        .font(.system(size: 24, weight: .semibold))
                    Spacer()
                    Button{

                    }label: {
                        Image(systemName: "basket")
                            .imageScale(.large)
                            .frame(width: 90, height: 68)
                            .background(.black)
                            .clipShape(Capsule())
                            .foregroundColor(.white)
                    }
                    .padding()
                       
                }
                .padding(.leading)
                .padding()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .frame(height: 80)
                .background(.white.opacity(0.7))
                .clipShape(Capsule())
            })
            
        }
        .padding()
        .frame(width: 300, height: 400)
        .background(recipe.color.opacity(0.15))
        .clipShape(.rect(cornerRadius: 50))
        .padding(.leading, 20)
    }
}

struct ImagePickerView: UIViewControllerRepresentable {
    var didImageSelected: (UIImage) -> Void

    @Environment(\.presentationMode) var presentationMode

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePickerView

        init(parent: ImagePickerView) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.didImageSelected(uiImage)
            }

            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<ImagePickerView>) {
    }
}



#Preview {
    RecommendRecipeView()
}
