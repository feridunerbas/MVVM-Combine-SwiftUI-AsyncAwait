//
//  SearchCitiesUseCase.swift
//  City Search
//
//  Created by Feridun Erbas on 25.03.2022.
//

import Foundation

protocol SearchCitiesUseCase {
    func callAsFunction(param: SearchCitiesParameter) async -> [City]
}
