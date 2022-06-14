//
//  String+Fake.swift
//  City SearchTests
//
//  Created by Feridun Erbas on 26.03.2022.
//

import Foundation

extension String {
    
    static var fake: String {
        UUID().uuidString
    }
    
}
