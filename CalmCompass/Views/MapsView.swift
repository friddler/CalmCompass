//
//  MapsView.swift
//  CalmCompass
//
//  Created by Edgar Backer on 2023-05-24.
//

import SwiftUI
import MapKit

struct MapsView: View {
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 60.1281610, longitude: 18.6435010), span: MKCoordinateSpan(latitudeDelta: 20.00, longitudeDelta: 10.00))
    @State private var selectedPlace: Place?
    @State private var isShowingMessage = false
    
    var places =
    [
        Place(name: "Helags Friskvård", street: "Ljungdalen", houseNumber: "210", postalCode: 84599, City: "Ljungdalen", latitude: 62.8541509, longitude: 12.7827347),
        Place(name: "ROMSjön", street: "Sjösvängen", houseNumber: "16", postalCode: 84599, City: "Funäsdalen", latitude: 62.5411867, longitude: 12.5141241),
        Place(name: "Stockholm", street: "Gotlandsgatan", houseNumber: "88", postalCode: 11638, City: "Stockholm", latitude: 59.3107017, longitude: 18.0855614),
        Place(name: "Gamla Stan Thai Massage", street: "Skomakargatan", houseNumber: "26", postalCode: 11638, City: "Stockholm", latitude: 59.3246004, longitude: 18.0704384),
        Place(name: "Svensk Kroppsterapi", street: "Rinmansgatan", houseNumber: "9", postalCode: 63346, City: "Eskilstuna", latitude: 59.3826082, longitude: 16.5103790),
        Place(name: "Effion Klassisk Massage ", street: "Västeråsvägen", houseNumber: "40A", postalCode: 63323, City: "Eskilstuna", latitude: 59.3745121, longitude: 16.4856495),
        Place(name: "Psykologi Idrott Massage", street: "Skatåsvägen", houseNumber: "25", postalCode: 41655, City: "Göteborg", latitude: 57.7031101, longitude: 12.0376512),
        Place(name: "Stellar Wellness", street: "LimstaängsvÄGEN", houseNumber: "2", postalCode: 87231, City: "Kramfors", latitude: 62.9326004, longitude: 17.7916838)
    ]
    
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
    }
}

struct MapPinView : View{
    var place : Place
    
    var body : some View {
       VStack {
            Image(systemName: "mappin")
                .resizable()
                .frame(width: 20, height: 20)
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
                                    Text("\(place.postalCode) \(place.City)")
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
