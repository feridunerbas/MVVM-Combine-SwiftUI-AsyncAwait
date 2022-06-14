//
//  CoordinateDataModel+Fake.swift
//  City SearchTests
//
//  Created by Feridun Erbas on 29.03.2022.
//

import Foundation
@testable import City_Search

extension CoordinateDataModel {
    
    static var fake: CoordinateDataModel {
        CoordinateDataModel(latitude: .fake, longitude: .fake)
    }
    
}
