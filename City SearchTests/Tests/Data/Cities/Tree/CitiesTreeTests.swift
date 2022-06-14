//
//  CitiesTreeTests.swift
//  City SearchTests
//
//  Created by Feridun Erbas on 29.03.2022.
//

import XCTest
@testable import City_Search

class CitiesTreeTests: XCTestCase {
    
    // MARK: - Properties
    var sut: CitiesTree!
    
    // MARK:  Lifecycle
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CitiesTree()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    
}

// MARK: - Test SearchInsertedRandomCityResultNotEmpty
extension CitiesTreeTests {
    
    func testSearchInsertedRandomCityResultNotEmpty() {
        let expectation = XCTestExpectation()
        Task {
            let fakeCities = (0..<10).map { _ in CityDataModel.fake }
            await sut.insert(cities: fakeCities)
            let searchResult = await sut.search(prefix: fakeCities.first!.name!, maxCount: 30)
            XCTAssertFalse(searchResult.isEmpty)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
        
    }
}

// MARK: - Test SearchesAmongLargeNumberOfCities
extension CitiesTreeTests {
    
    func testSearchesAmongLargeNumberOfCities() {
        let expectation = XCTestExpectation()
        Task {
            let range = (0..<250_000)
            var largeNumberOfCities = range.map { _ in CityDataModel.fake }
            let predefinedInitials = "predefinedInitials"
            let totalInsertedPredefinedInitialsCount = 10
            (0..<totalInsertedPredefinedInitialsCount).forEach { _ in
                let index = Int.random(in: range)
                let name = predefinedInitials + String.fake
                let city = CityDataModel(id: .fake, name: name, country: .fake, coordinate: .fake)
                largeNumberOfCities.insert(city, at: index)
            }
            await sut.insert(cities: largeNumberOfCities)
            let searchResult = await sut.search(prefix: predefinedInitials, maxCount: 30)
            XCTAssertTrue(searchResult.count >= totalInsertedPredefinedInitialsCount)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 100)
    }
    
}

// MARK: - Test SearchesAmongLargeNumberOfCities
extension CitiesTreeTests {
    
    func testSearchesSpecialCharacters() {
        let expectation = XCTestExpectation()
        Task {
            let specialCharacters = "ΌçعдåÄ"
            for char in specialCharacters {
                let name: String = "\(char)\(String.fake)"
                let city = CityDataModel(id: .fake, name: name, country: .fake, coordinate: .fake)
                await sut.insert(cities: [city])
                let searchResult = await sut.search(prefix: String(char), maxCount: 1)
                XCTAssertFalse(searchResult.isEmpty)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 100)
    }
}

// MARK: - Test SearchesAmongLargeNumberOfCities
extension CitiesTreeTests {
    
    func testReturnsResultsSorted() {
        let expectation = XCTestExpectation()
        Task {
            let cities = (0..<100).map {_ in
                CityDataModel.fake
            }
            await sut.insert(cities: cities)
            let searchResult = await sut.search(prefix: "", maxCount: 100)
            let originalSortedCities = cities.sorted { $0.name?.compare($1.name ?? "") == .orderedAscending}
            searchResult.enumerated().forEach { index, value in
                let originalSortedId = originalSortedCities[index].id
                XCTAssertEqual(originalSortedId, value.id)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 100)
    }
    
}

// MARK: - Test SearchesAmongLargeNumberOfCities
extension CitiesTreeTests {
    
    func testInsertsLargeNamedCity() {
        let expectation = XCTestExpectation()
        Task {
            let text = "qwertyuıopğüasdfghjklşizxcvbnmöç"
            let longNameChars = (0..<500).map { _ -> String in
                String(text.randomElement()!)
            }.joined()
            let longName = String(longNameChars)
            let longNamedCity = CityDataModel(id: .fake, name: longName, country: .fake, coordinate: .fake)
            var moreCities = (0..<10_000).map { _ in
                CityDataModel.fake
            }
            moreCities.insert(longNamedCity, at: 9_000)
            await sut.insert(cities: moreCities)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 100)
    }
    
}
