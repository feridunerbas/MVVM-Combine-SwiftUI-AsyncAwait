//
//  HomeMapViewModel.swift
//  City Search
//
//  Created by Feridun Erbas on 31.03.2022.
//

import CoreLocation
import MapKit
import SwiftUI

class HomeMapViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var mapRegion = MKCoordinateRegion()
    @Published var annotations: [CityAnnotation] = []
    
}

extension HomeMapViewModel {
    
    func focus(coordinate: Coordinate) {
        let center = coordinate.asCLLocationCoordinate2D()
        let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        self.mapRegion = MKCoordinateRegion(center: center, span: span)
    }
    
}
