import SwiftUI
import MapKit

struct MapContentBuilder: View {
    @Binding var selectedCountry: String?

    var body: some View {
      //
            Text("Preferred countries?")
                .font(.system(size: 28))
                .fontWeight(.black)
                .padding(.top, 1)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
            GeometryReader { geometry in
                Map(
                    coordinateRegion: Binding(
                        get: {
                            if let country = selectedCountry {
                                return getCoordinateRegion(for: country)
                            } else {
                                return getCoordinateRegion(for: "United States")
                            }
                        },
                        set: { _, _ in }
                    ),
                    showsUserLocation: true
                )
                .onAppear {
                    // You can add any additional setup code for the map here
                }
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.clear, lineWidth: 1)) // Optional: Add a stroke
            }
            .frame(height: UIScreen.main.bounds.height * 0.3) // Adjust the height as needed
            .padding(.horizontal, 5) // Adjust the padding as needed
        
    }

    private func getCoordinateRegion(for country: String) -> MKCoordinateRegion {
        // Implement your logic to get the coordinates for the given country
        // You might want to use a geocoding service or a predefined dictionary of countries and their coordinates
        // For simplicity, I'll use a default coordinate region for the example
        let defaultCoordinate = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
        return MKCoordinateRegion(
            center: defaultCoordinate,
            span: MKCoordinateSpan(latitudeDelta: 10.0, longitudeDelta: 10.0)
        )
    }
}
struct MyPreferredMapContentView: View {
    @State private var countryName: String = ""
    @State private var selectedCountry: String?
    @State private var countryList: [String] = []

    @State private var isHomeViewPresented = false

    var body: some View {
        NavigationView{
        ZStack {
            ViscosityCanvasMap()
            VStack {
                MapContentBuilder(selectedCountry: $selectedCountry)
                    .padding()
                
                HStack {
                    TextField("Enter country name", text: $countryName, onCommit: {
                        confirmSelection()
                    })
                    .padding()
                    .textFieldStyle(.plain)
                    .frame(width: UIScreen.main.bounds.width * 0.5, height: 70) // Set the fixed height
                    
                    Button(action: {
                        confirmSelection()
                    }) {
                        Text("Add")
                            .foregroundColor(Color(rgb: 0xD2D90B))
                            .padding()
                            .background(Color.clear)
                            .cornerRadius(15)
                            .frame(height: 20) // Set the fixed height
                    }
                    .padding()
                }
                
                List(countryList, id: \.self) { country in
                    GeometryReader { geometry in
                        Text(country)
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                            .padding(10)
                            .background(Color(red: 0.82, green: 0.85, blue: 0.41))
                            .cornerRadius(10)
                    }
                    .listRowInsets(EdgeInsets())
                }
                .scrollContentBackground(.hidden)
                .listRowSeparator(.hidden)
                .padding()
                
                Spacer()
                NavigationLink(destination: MainView()) { // Replace AnotherView with your target view
                    Text("Save")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(red: 0.827, green: 0.847, blue: 0.043))
                        .cornerRadius(15)
                        .padding()
                }
                .padding()
                
            }
                }
                .padding()
        }.navigationBarBackButtonHidden(true)
            
        }
    

    private func confirmSelection() {
        // Here you can perform any additional validation or confirmation logic
        // For simplicity, I'm just updating the selectedCountry and adding it to the list based on user input
        withAnimation {
            selectedCountry = countryName
            countryList.append(countryName)
            countryName = ""
        }
    }
}




struct MyMapContentView_Previews: PreviewProvider {
    static var previews: some View {
        MyPreferredMapContentView()
    }
}
