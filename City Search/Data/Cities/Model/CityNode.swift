//
//  CityNode.swift
//  City Search
//
//  Created by Feridun Erbas on 29.03.2022.
//

import Foundation

class CityNode {
    var dictionary: Dictionary<Character, CityNode> = [:]
    var cities: [CityDataModel] = []
    var sortedKeys: [Character] = []
}
