//
//  CityAnnotation.swift
//  City Search
//
//  Created by Feridun Erbas on 31.03.2022.
//

import Foundation

struct CityAnnotation: Identifiable {
    
    // MARK: Properties
    let id: Int
    let title: String
    let coordinate: Coordinate
    
    // MARK: Init
    init(city: City) {
        id = city.id
        title = city.name
        coordinate = city.coordinate
    }
}
