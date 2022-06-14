//
//  CitiesTreeProtocol.swift
//  City Search
//
//  Created by Feridun Erbas on 29.03.2022.
//

import Foundation

protocol CitiesTreeProtocol {
    
    /// Constructs the cities tree with given values
    ///
    /// - parameter cities: Initial cities array of the tree
    ///
    func insert(cities: [CityDataModel]) async
    
    /// Constructs the cities tree with given values
    ///
    /// - parameter cities: Initial cities array of the tree
    /// - returns an array of City objects matching the search criteria
    ///
    func search(prefix: String, maxCount: Int) async -> [CityDataModel]
}
