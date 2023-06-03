//
//  Place.swift
//  CalmCompass
//
//  Created by Edgar Backer on 2023-05-24.
//

import Foundation
import CoreLocation

struct Place : Identifiable {
    var id = UUID()
    
    var name : String
    var street : String
    var houseNumber : String
    var postalCode : Int
    var city : String
    var latitude : Double
    var longitude : Double
    
    var coordinate : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
}
