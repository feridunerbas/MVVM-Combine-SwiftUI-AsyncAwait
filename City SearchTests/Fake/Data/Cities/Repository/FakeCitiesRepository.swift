//
//  FakeCitiesRepository.swift
//  City SearchTests
//
//  Created by Feridun Erbas on 2.04.2022.
//

import Foundation
@testable import City_Search

class FakeCitiesRepository {
    
    // MARK: - Fake Properties
    var searchResult: [CityDataModel]!
}

// MARK: - CitiesRepository
extension FakeCitiesRepository: CitiesRepository {
    
    func prepare() async throws {
        
    }
    
    func search(request: SearchCityRequest) async -> [CityDataModel] {
        searchResult
    }
    
    
}
