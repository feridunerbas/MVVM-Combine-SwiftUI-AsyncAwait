//
//  LoadJSONFromFileTests.swift
//  City SearchTests
//
//  Created by Feridun Erbas on 29.03.2022.
//

import XCTest
@testable import City_Search

class LoadJSONFromFileTests: XCTestCase {
    
    // MARK: - Properties
    var sut = LoadJSONFromFile()

}

extension LoadJSONFromFileTests {
    
    func testLoadsCitiesFromFile() {
        let expectation = XCTestExpectation()
        Task {
            let path = Bundle.main.path(forResource: "cities", ofType: "json")!
            let cities: [CityDataModel]? = try? await sut.callAsFunction(inPath: path)
            XCTAssertNotNil(cities)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
}
