//
//  LoadJSONFromFileProtocol.swift
//  City Search
//
//  Created by Feridun Erbas on 29.03.2022.
//

import Foundation

protocol LoadJSONFromFileProtocol {
    
    /// Loads cities json file
    ///
    /// - parameter inPath: The path to the json file containing cities
    /// - throws: if values requested from the payload are corrupted, or if the given data is not valid JSON.
    /// - throws: An error if any value throws an error during decoding.
    /// - throws: An error in the Cocoa domain, if `url` for path provided cannot be read.
    ///
    func callAsFunction<T: Decodable>(inPath path: String) async throws -> T
    
}
