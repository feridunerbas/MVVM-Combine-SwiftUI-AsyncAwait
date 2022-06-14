//
//  Coordinate+CLLocationCoordinate2D.swift
//  City Search
//
//  Created by Feridun Erbas on 31.03.2022.
//

import CoreLocation

extension Coordinate {
    
    func asCLLocationCoordinate2D() -> CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
}
