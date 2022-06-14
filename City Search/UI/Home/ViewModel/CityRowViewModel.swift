//
//  CityRowViewModel.swift
//  City Search
//
//  Created by Feridun Erbas on 31.03.2022.
//

import Foundation

class CityRowViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var title: String
    @Published var subtitle: String
    
    // MARK: - Properties
    let model: City
    
    // MARK: - Init
    init(city: City) {
        model = city
        title = "\(city.name) - \(city.country)"
        subtitle = "\(city.coordinate.latitude),\(city.coordinate.longitude)"
    }
}

extension CityRowViewModel: Identifiable {}
