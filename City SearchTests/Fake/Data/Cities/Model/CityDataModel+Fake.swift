//
//  CityDataModel+Fake.swift
//  City SearchTests
//
//  Created by Feridun Erbas on 29.03.2022.
//

import Foundation
@testable import City_Search

extension CityDataModel {
    
    static var fake: CityDataModel {
        CityDataModel(id: .fake,
             name: .fake,
             country: .fake,
             coordinate: .fake)
    }
    
}
