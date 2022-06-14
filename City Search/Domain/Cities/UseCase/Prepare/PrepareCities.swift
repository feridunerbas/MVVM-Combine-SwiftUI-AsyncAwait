//
//  PrepareCities.swift
//  City Search
//
//  Created by Feridun Erbas on 31.03.2022.
//

import Foundation

class PrepareCities {
    
    // MARK: - Properties
    let repository: CitiesRepository
    
    // MARK: - Init
    init(repository: CitiesRepository) {
        self.repository = repository
    }
}

// MARK: - SearchCitiesUseCase
extension PrepareCities: PrepareCitiesUseCase {
    
    func callAsFunction() async throws  {
        try await repository.prepare()
    }
    
}
