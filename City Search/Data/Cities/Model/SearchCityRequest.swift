//
//  SearchCityRequest.swift
//  City Search
//
//  Created by Feridun Erbas on 30.03.2022.
//

import Foundation

struct SearchCityRequest: Encodable {
    let keyword: String
    let maxCount: Int
}
