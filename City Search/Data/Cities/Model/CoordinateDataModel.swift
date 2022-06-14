//
//  CoordinateDataModel.swift
//  City Search
//
//  Created by Feridun Erbas on 26.03.2022.
//

import Foundation

struct CoordinateDataModel: Decodable {
    
    // MARK: - Properties
    let latitude: Double?
    let longitude: Double?
    
    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
    }
}
