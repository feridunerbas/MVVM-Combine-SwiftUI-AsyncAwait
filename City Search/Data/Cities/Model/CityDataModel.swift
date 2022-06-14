//
//  CityDataModel.swift
//  City Search
//
//  Created by Feridun Erbas on 26.03.2022.
//

import Foundation

class CityDataModel: Decodable {
    
    // MARK: - Properties
    let id: Int?
    let name: String?
    let country: String?
    let coordinate: CoordinateDataModel?
    
    // MARK: - Init
    init(id: Int?, name: String?, country: String?, coordinate: CoordinateDataModel?) {
        self.id = id
        self.name = name
        self.country = country
        self.coordinate = coordinate
    }
    
    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case country
        case coordinate = "coord"
    }
}
