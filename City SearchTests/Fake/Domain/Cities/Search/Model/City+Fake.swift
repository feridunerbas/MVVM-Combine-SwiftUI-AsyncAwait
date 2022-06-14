//
//  City+Fake.swift
//  City SearchTests
//
//  Created by Feridun Erbas on 3.04.2022.
//

import Foundation
@testable import City_Search

extension City {
    
    static var fake: City {
        City(id: .fake,
             name: .fake,
             country: .fake,
             coordinate: .fake)
    }
    
}
