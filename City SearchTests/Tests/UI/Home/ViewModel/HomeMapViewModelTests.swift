//
//  HomeMapViewModelTests.swift
//  City SearchTests
//
//  Created by Feridun Erbas on 3.04.2022.
//

import XCTest
@testable import City_Search

class HomeMapViewModelTests: XCTestCase {
    
    // MARK: - Properties
    var sut: HomeMapViewModel!
    
    // MARK:  Lifecycle
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = HomeMapViewModel()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
}

// MARK: - Test SetsMapRegionWithCorrectCenterValues
extension HomeMapViewModelTests {
    
    func testSetsMapRegionWithCorrectCenterValues() {
        let coordinate: Coordinate = Coordinate(latitude: 29, longitude: 41)
        sut.focus(coordinate: coordinate)
        let regionCenter = sut.mapRegion.center
        XCTAssertEqual(coordinate.latitude, regionCenter.latitude)
        XCTAssertEqual(coordinate.longitude, regionCenter.longitude)
    }
    
}
