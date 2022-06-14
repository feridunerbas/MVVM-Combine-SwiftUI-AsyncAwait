//
//  SearchCitiesParameter+Fake.swift
//  City SearchTests
//
//  Created by Feridun Erbas on 26.03.2022.
//

import Foundation
@testable import City_Search

extension SearchCitiesParameter {
    
    static var fake: SearchCitiesParameter {
        SearchCitiesParameter(keyword: .fake, maxCount: .fake)
    }
    
}
