//
//  CitiesRepository.swift
//  City Search
//
//  Created by Feridun Erbas on 25.03.2022.
//

import Foundation

protocol CitiesRepository {
    
    /// Do initial heavy work and prepare for search
    ///
    ///
    func prepare() async throws
    
    /// Search cities
    ///
    /// - parameter request: Search request to be made. Includes keyword and result count
    /// - returns an array of CityDataModel objects matching the search criteria
    ///
    func search(request: SearchCityRequest) async -> [CityDataModel]
}
