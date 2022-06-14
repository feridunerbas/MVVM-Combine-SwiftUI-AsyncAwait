//
//  HomeViewModel.swift
//  City Search
//
//  Created by Feridun Erbas on 30.03.2022.
//


import Combine

class HomeViewModel: ObservableObject {
    
    // MARK: - Injected Properties
    let searchCities: SearchCitiesUseCase
    let prepareCities: PrepareCitiesUseCase
    
    // MARK: - Published properties
    @Published var cityRowViewModels: [CityRowViewModel] = []
    @Published var isSearchingCities: Bool = true
    @Published var isLoading: Bool = true
    @Published var searchMinimized = true
    
    // MARK: - Child ViewModels
    private weak var homeMapViewModel: HomeMapViewModel?
    private weak var searchViewModel:  SearchViewModel?
    
    // MARK: - Cancellable
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Init
    init(searchCities: SearchCitiesUseCase, prepareCities: PrepareCitiesUseCase) {
        self.searchCities = searchCities
        self.prepareCities = prepareCities
    }
    
    @MainActor
    func prepare() async throws {
        isLoading = true
        try await prepareCities()
        try await searchViewModel?.loadCities(keyword: "")
        isLoading = false
    }
    
    @MainActor
    func loadCities(keyword: String) async {
        let param = SearchCitiesParameter(keyword: keyword, maxCount: 30)
        let searchResult = await searchCities(param: param)
        cityRowViewModels = searchResult.map { CityRowViewModel(city: $0) }
    }
    
    func selected(city: City) {
        homeMapViewModel?.annotations = [
            CityAnnotation(city: city)
        ]
        homeMapViewModel?.focus(coordinate: city.coordinate)
        searchMinimized = true
    }
    
}

// MARK: - MapViewModel
extension HomeViewModel {
    
    func makeMapViewModel() -> HomeMapViewModel {
        let vm = HomeMapViewModel()
        homeMapViewModel = vm
        return vm
    }
    
}

// MARK: - SearchViewModel
extension HomeViewModel {
    
    func makeSearchViewModel() -> SearchViewModel {
        let vm = SearchViewModel(searchCities: searchCities)
        searchViewModel = vm
        vm.$selectedCity.compactMap { $0 }
            .sink(receiveValue: selected(city:))
            .store(in: &cancellables)
        return vm
    }
    
}
