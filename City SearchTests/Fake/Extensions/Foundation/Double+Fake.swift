//
//  Double+Fake.swift
//  City SearchTests
//
//  Created by Feridun Erbas on 29.03.2022.
//

import Foundation

extension Double {
    
    static var fake: Double {
        .random(in: (.leastNormalMagnitude)..<(.greatestFiniteMagnitude))
    }
    
}
