//
//  MapsView.swift
//  CalmCompass
//
//  Created by Edgar Backer on 2023-05-24.
//

import SwiftUI
import MapKit
import Firebase

struct MapsView: View {
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 60.1281610, longitude: 18.6435010), span: MKCoordinateSpan(latitudeDelta: 20.00, longitudeDelta: 10.00))
    @State private var selectedPlace: Place?
    @State private var isShowingMessage = false
    @State private var selectedTab: Tab = .house
    @State private var places: [Place] = []
    @State private var isAddingPlace = false
    
//    @State var places =
//    [
//        Place(name: "Helags Friskvård", street: "Ljungdalen", houseNumber: "210", postalCode: 84599, City: "Ljungdalen", latitude: 62.8541509, longitude: 12.7827347),
//        Place(name: "ROMSjön", street: "Sjösvängen", houseNumber: "16", postalCode: 84599, City: "Funäsdalen", latitude: 62.5411867, longitude: 12.5141241),
//        Place(name: "Stockholm", street: "Gotlandsgatan", houseNumber: "88", postalCode: 11638, City: "Stockholm", latitude: 59.3107017, longitude: 18.0855614),
//        Place(name: "Gamla Stan Thai Massage", street: "Skomakargatan", houseNumber: "26", postalCode: 11638, City: "Stockholm", latitude: 59.3246004, longitude: 18.0704384),
//        Place(name: "Svensk Kroppsterapi", street: "Rinmansgatan", houseNumber: "9", postalCode: 63346, City: "Eskilstuna", latitude: 59.3826082, longitude: 16.5103790),
//        Place(name: "Effion Klassisk Massage ", street: "Västeråsvägen", houseNumber: "40A", postalCode: 63323, City: "Eskilstuna", latitude: 59.3745121, longitude: 16.4856495),
//        Place(name: "Psykologi Idrott Massage", street: "Skatåsvägen", houseNumber: "25", postalCode: 41655, City: "Göteborg", latitude: 57.7031101, longitude: 12.0376512),
//        Place(name: "Stellar Wellness", street: "LimstaängsvÄGEN", houseNumber: "2", postalCode: 87231, City: "Kramfors", latitude: 62.9326004, longitude: 17.7916838)
//    ]
    
    var body: some View {
        VStack{
            Map(coordinateRegion: $region,
                interactionModes: [.all],
                annotationItems: places) { place in
                //                MapMarker(coordinate: place.coordinate)
                MapAnnotation(coordinate: place.coordinate, anchorPoint: CGPoint(x: 0.5, y: 0.5)){
                    Button(action: {
                        selectedPlace =  place
                    }){
                        MapPinView(place: place)
                    }
                }
            }
        }
        .sheet(item: $selectedPlace) { place in
            PlaceDetailView(selectedPlace: $selectedPlace, place: place)
                .background(Color.clear)
                }
        .overlay(Navigation_bar_View(selectedTab: $selectedTab))
        .overlay(
                   Button(action: {
                       isAddingPlace = true
                   }) {
                       Image(systemName: "plus.circle.fill")
                           .resizable()
                           .frame(width: 40, height: 40)
                           .padding()
                   }
                   .foregroundColor(.blue)
                   .offset(x: 150, y: 300)
                   .opacity(isAddingPlace ? 0.0 : 1.0)
                   .animation(.default)
               )
               .sheet(isPresented: $isAddingPlace) {
                   AddPlaceView(isAddingPlace: $isAddingPlace, addPlaceAction: addPlaceToFirebase)
               }
        .onAppear{
            fetchPlacesFromFirebase()
            //        storePlacesInFirebase
        }
    }
    
    private func addPlaceToFirebase(place: Place) {
            places.append(place)
        storePlacesInFirebase()
        }
    
    private func fetchPlacesFromFirebase() {
            let db = Firestore.firestore()
            
            db.collection("places").getDocuments { snapshot, error in
                if let error = error {
                    print("Error fetching places: \(error.localizedDescription)")
                    return
                }
                
                guard let documents = snapshot?.documents else {
                    print("No documents found")
                    return
                }
                
                var fetchedPlaces: [Place] = []
                
                for document in documents {
                    if let place = parsePlaceData(from: document) {
                        fetchedPlaces.append(place)
                    }
                }
                
                places = fetchedPlaces
            }
        }
    
    private func parsePlaceData(from document: QueryDocumentSnapshot) -> Place? {
            let data = document.data()
            
            guard let name = data["name"] as? String,
                  let street = data["street"] as? String,
                  let houseNumber = data["houseNumber"] as? String,
                  let postalCode = data["postalCode"] as? Int,
                  let city = data["city"] as? String,
                  let latitude = data["latitude"] as? Double,
                  let longitude = data["longitude"] as? Double else {
                return nil
            }
            
        return Place(name: name, street: street, houseNumber: houseNumber, postalCode: postalCode, city: city, latitude: latitude, longitude: longitude)
        }
    
    private func storePlacesInFirebase() {
        let db = Firestore.firestore()
        
        for place in places {
            db.collection("places").addDocument(data: [
                "name": place.name,
                "street": place.street,
                "houseNumber": place.houseNumber,
                "postalCode": place.postalCode,
                "city": place.city,
                "latitude": place.latitude,
                "longitude": place.longitude
            ]) { error in
                if let error = error {
                    print("Error storing place: \(error.localizedDescription)")
                } else {
                    print("Place stored successfully")
                }
            }
        }
    }
}

struct AddPlaceView: View {
    @Binding var isAddingPlace: Bool
    var addPlaceAction: (Place) -> Void
    
    @State private var name = ""
    @State private var street = ""
    @State private var houseNumber = ""
    @State private var postalCode = ""
    @State private var city = ""
    @State private var latitude = ""
    @State private var longitude = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Place Details")) {
                    TextField("Name", text: $name)
                    TextField("Street", text: $street)
                    TextField("House Number", text: $houseNumber)
                    TextField("Postal Code", text: $postalCode)
                    TextField("City", text: $city)
                    TextField("Latitude", text: $latitude)
                    TextField("Longitude", text: $longitude)
                }
                
                Section {
                    Button("Add Place") {
                        guard let postalCodeInt = Int(postalCode),
                              let latitudeDouble = Double(latitude),
                              let longitudeDouble = Double(longitude) else {
                            // Handle invalid input here
                            return
                        }
                        
                        let place = Place(name: name,
                                          street: street,
                                          houseNumber: houseNumber,
                                          postalCode: postalCodeInt,
                                          city: city,
                                          latitude: latitudeDouble,
                                          longitude: longitudeDouble)
                        
                        addPlaceAction(place)
                        isAddingPlace = false
                    }
                }
            }
            .navigationTitle("Add Place")
        }
    }
}


struct MapPinView : View{
    var place : Place
    
    var body : some View {
       VStack {
            Image(systemName: "mappin")
                .resizable()
                .frame(width: 10, height: 30)
            Text(place.name)
        }
    }
}

struct PlaceDetailView: View {
    @Binding var selectedPlace: Place?
    var place: Place
    
    var body: some View {
        VStack{
            Image("ForestView")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .overlay(
                    VStack {
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .foregroundStyle(.linearGradient(colors: [.clear], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .frame(width:250, height:230)
                            .overlay(
                                VStack{
                                    Text(place.name)
                                        .font(.title)
                                    Text("Address:")
                                        .font(.headline)
                                    Text("\(place.street) \(place.houseNumber)")
                                    Text("\(place.postalCode) \(place.city)")
                                    Text("Latitude: \(place.latitude)")
                                    Text("Longitude: \(place.longitude)")
                                }
                                    .foregroundStyle(.linearGradient(colors: [.white], startPoint: .topLeading, endPoint: .bottomTrailing))
                            )
                        
                    }
                )
            Spacer()
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .frame(width: 90, height: 30)
                .foregroundStyle(.linearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                .overlay(Button("Close") {
                    selectedPlace = nil
                }.foregroundColor(.white))
        }
    }
}



struct MapsView_Previews: PreviewProvider {
    static var previews: some View {
        MapsView()
    }
}
