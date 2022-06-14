//
//  SearchCities.swift
//  City Search
//
//  Created by Feridun Erbas on 25.03.2022.
//

import Foundation

class SearchCities {
    
    // MARK: - Properties
    let repository: CitiesRepository
    
    // MARK: - Init
    init(repository: CitiesRepository) {
        self.repository = repository
    }
}

// MARK: - SearchCitiesUseCase
extension SearchCities: SearchCitiesUseCase {
    
    func callAsFunction(param: SearchCitiesParameter) async -> [City] {
        let request = makeSearchCityRequest(withParam: param)
        let result = await repository.search(request: request)
        return result.compactMap { mapCity(from: $0) }
    }
    
}

// MARK: - Preparation for request
private extension SearchCities {
    
    func makeSearchCityRequest(withParam param: SearchCitiesParameter) -> SearchCityRequest {
        SearchCityRequest(keyword: param.keyword, maxCount: param.maxCount)
    }
    
}

// MARK: - Map response models
private extension SearchCities {
   
    func mapCity(from model: CityDataModel) -> City? {
        guard let id = model.id,
                let name = model.name,
                let coordinateDataModel = model.coordinate,
                let coordinate = mapCoordinate(from: coordinateDataModel)
        else { return nil }
        return City(id: id,
                    name: name,
                    country: model.country ?? "",
                    coordinate: coordinate)
    }
    
    func mapCoordinate(from model: CoordinateDataModel) -> Coordinate? {
        guard let latitude = model.latitude,
              let longitude = model.longitude
        else { return nil }
        return Coordinate(latitude: latitude,
                          longitude: longitude)
    }
}
