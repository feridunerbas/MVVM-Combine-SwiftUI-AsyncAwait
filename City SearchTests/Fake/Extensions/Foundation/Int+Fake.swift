//
//  Int+Fake.swift
//  City SearchTests
//
//  Created by Feridun Erbas on 29.03.2022.
//

import Foundation

extension Int {
    
    static var fake: Int {
        .random(in: (.min)..<(.max))
    }
    
}
