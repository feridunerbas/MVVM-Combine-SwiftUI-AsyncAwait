//
//  Coordinate+Fake.swift
//  City SearchTests
//
//  Created by Feridun Erbas on 2.04.2022.
//

import Foundation
@testable import City_Search

extension Coordinate {
    
    static var fake: Coordinate {
        Coordinate(latitude: .fake, longitude: .fake)
    }
    
}
