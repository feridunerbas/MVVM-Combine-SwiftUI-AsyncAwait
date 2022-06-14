//
//  SearchViewModel.swift
//  City Search
//
//  Created by Feridun Erbas on 1.04.2022.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    // MARK: Injected Properties
    let searchCities: SearchCitiesUseCase
    
    // MARK: - Published properties
    @Published var cityRowViewModels: [CityRowViewModel] = []
    @Published var selectedCity: City?
        
    // MARK: - Init
    init(searchCities: SearchCitiesUseCase) {
        self.searchCities = searchCities
    }
    
    @MainActor
    func loadCities(keyword: String) async throws {
        let param = SearchCitiesParameter(keyword: keyword, maxCount: 30)
        let searchResult = await searchCities(param: param)
        cityRowViewModels = searchResult.map { CityRowViewModel(city: $0) }
    }
    
    func selected(cityRowViewModel: CityRowViewModel) {
        selectedCity = cityRowViewModel.model
    }
    
}
