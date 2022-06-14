//
//  HomeViewModelTests.swift
//  City SearchTests
//
//  Created by Feridun Erbas on 3.04.2022.
//

import XCTest
@testable import City_Search

class HomeViewModelTests: XCTestCase {
    
    // MARK: - Properties
    var sut: HomeViewModel!
    var searchCitiesUseCaseSpy: FakeSearchCitiesUseCase!
    var prepareCitiesUseCaseSpy: FakePrepareCitiesUseCase!
    
    // MARK:  Lifecycle
    override func setUpWithError() throws {
        try super.setUpWithError()
        searchCitiesUseCaseSpy = FakeSearchCitiesUseCase()
        prepareCitiesUseCaseSpy = FakePrepareCitiesUseCase()
        sut = HomeViewModel(searchCities: searchCitiesUseCaseSpy, prepareCities: prepareCitiesUseCaseSpy)
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
}

// MARK: - Test SuccessfullySignalsFinishLoadingAfterPrepare
extension HomeViewModelTests {
    
    func testSuccessfullySignalsFinishLoadingAfterPrepare() {
        let expectation = XCTestExpectation()
        Task {
            try await sut.prepare()
            XCTAssertFalse(sut.isLoading)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
}

// MARK: - Test SuccessfullyLoads Cities
extension HomeViewModelTests {
    
    func testCreatesChildViewModelsForEveryCityReturnedFromSearchCitiesUseCase() {
        let expectation = XCTestExpectation()
        Task {
            let fakeCities: [City] = [
                .fake,
                .fake,
                .fake
            ]
            searchCitiesUseCaseSpy.fakeCitiesResult = fakeCities
            await sut.loadCities(keyword: "")
            sut.cityRowViewModels.forEach { vm in
                XCTAssertTrue(fakeCities.contains { $0.id == vm.model.id })
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
}

// MARK: - Test SuccessfullyLoads Cities
extension HomeViewModelTests {
    
    func testSignalsMinimizeSearchWhenSignaledSelectionFromSearchViewModel() {
        let searchViewModel = sut.makeSearchViewModel()
        let row = CityRowViewModel(city: .fake)
        searchViewModel.selected(cityRowViewModel: row)
        XCTAssertTrue(sut.searchMinimized)
    }
    
}
