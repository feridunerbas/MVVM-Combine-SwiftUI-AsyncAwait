//
//  FakeSearchCitiesUseCase.swift
//  City SearchTests
//
//  Created by Feridun Erbas on 3.04.2022.
//

import Foundation
@testable import City_Search

class FakeSearchCitiesUseCase {
    
    // MARK: - Fake Properties
    var fakeCitiesResult: [City] = []
}

// MARK: - SearchCitiesUseCase
extension FakeSearchCitiesUseCase: SearchCitiesUseCase {
    
    func callAsFunction(param: SearchCitiesParameter) async -> [City] {
        fakeCitiesResult
    }
    
}
