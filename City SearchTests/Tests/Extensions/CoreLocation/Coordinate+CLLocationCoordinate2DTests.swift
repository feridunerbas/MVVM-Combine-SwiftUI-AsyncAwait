//
//  Coordinate+CLLocationCoordinate2DTests.swift
//  City SearchTests
//
//  Created by Feridun Erbas on 2.04.2022.
//

import XCTest
@testable import City_Search

class Coordinate_CLLocationCoordinate2DTests: XCTestCase {}

extension Coordinate_CLLocationCoordinate2DTests {
    
    func testConvertsValuesUntouched() {
        let coordinate: Coordinate = .fake
        let converted = coordinate.asCLLocationCoordinate2D()
        XCTAssertEqual(coordinate.longitude, converted.longitude)
        XCTAssertEqual(coordinate.latitude, converted.latitude)
    }
    
}
