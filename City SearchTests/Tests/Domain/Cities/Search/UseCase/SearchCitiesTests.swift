//
//  SearchCitiesTests.swift
//  City SearchTests
//
//  Created by Feridun Erbas on 26.03.2022.
//

import XCTest
@testable import City_Search

class SearchCitiesTests: XCTestCase {
    
    // MARK: - Properties
    var sut: SearchCities!
    var spy: FakeCitiesRepository!
    
    // MARK:  Lifecycle
    override func setUpWithError() throws {
        try super.setUpWithError()
        spy = FakeCitiesRepository()
        sut = SearchCities(repository: spy)
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
}

// MARK: - Test ProcessesWellformedCitiesData
extension SearchCitiesTests {
    
    func testProcessesWellformedCitiesData() {
        let expectation = XCTestExpectation()
        Task {
            let fakeResults: [CityDataModel] = [
                .fake,
                .fake,
                .fake
            ]
            spy.searchResult = fakeResults
            let cities = await sut.callAsFunction(param: .fake)
            fakeResults.forEach { model in
                XCTAssertTrue(cities.contains(where: { $0.id == model.id }))
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
}

// MARK: - Test DropsMissingRequiredCityData
extension SearchCitiesTests {
    
    func testDropsMissingRequiredCityData() {
        let expectation = XCTestExpectation()
        Task {
            let idLessCityData = CityDataModel(id: nil, name: .fake, country: .fake, coordinate: .fake)
            let nameLessCityData = CityDataModel(id: .fake, name: nil, country: .fake, coordinate: .fake)
            let coordinateLessCityData = CityDataModel(id: .fake, name: .fake, country: .fake, coordinate: nil)
            spy.searchResult = [
                idLessCityData,
                nameLessCityData,
                coordinateLessCityData
            ]
            let cities = await sut.callAsFunction(param: .fake)
            XCTAssertTrue(cities.isEmpty)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
}
