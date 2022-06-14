//
//  MakeHomeView.swift
//  City Search
//
//  Created by Feridun Erbas on 31.03.2022.
//

import Foundation

class MakeHomeView {
    
    func callAsFunction() -> HomeView {
        let citiesTree = CitiesTree()
        let loadJSONFromFile = LoadJSONFromFile()
        let repository = CitiesLocalRepository(citiesTree: citiesTree, loadJSONFromFile: loadJSONFromFile)
        let searchCities = SearchCities(repository: repository)
        let prepareCities = PrepareCities(repository: repository)
        let viewModel = HomeViewModel(searchCities: searchCities, prepareCities: prepareCities)
        let homeView = HomeView(viewModel: viewModel)
        return homeView
    }
    
}
