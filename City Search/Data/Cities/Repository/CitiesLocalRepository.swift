//
//  CitiesLocalRepository.swift
//  City Search
//
//  Created by Feridun Erbas on 25.03.2022.
//

import Foundation

class CitiesLocalRepository {
    
    // MARK: - Properties
    let citiesTree: CitiesTreeProtocol
    let loadJSONFromFile: LoadJSONFromFileProtocol
    
    // MARK: - Init
    init(citiesTree: CitiesTreeProtocol, loadJSONFromFile: LoadJSONFromFileProtocol) {
        self.citiesTree = citiesTree
        self.loadJSONFromFile = loadJSONFromFile
    }
    
}

// MARK: - CitiesRepository
extension CitiesLocalRepository: CitiesRepository {
    
    func prepare() async throws {
        let path = Bundle.main.path(forResource: "cities", ofType: "json")!
        let loadedCities: [CityDataModel] = try await loadJSONFromFile(inPath: path)
        await citiesTree.insert(cities: loadedCities)
    }
    
    func search(request: SearchCityRequest) async -> [CityDataModel] {
        await citiesTree.search(prefix: request.keyword, maxCount: request.maxCount)
    }
    
}
