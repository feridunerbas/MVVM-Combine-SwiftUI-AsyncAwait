//
//  LoadJSONFromFile.swift
//  City Search
//
//  Created by Feridun Erbas on 29.03.2022.
//

import Foundation

class LoadJSONFromFile {}

extension LoadJSONFromFile: LoadJSONFromFileProtocol {
    
    func callAsFunction<T: Decodable>(inPath path: String) async throws -> T {
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        let decoded = try JSONDecoder().decode(T.self, from: data)
        return decoded
    }
 
}
