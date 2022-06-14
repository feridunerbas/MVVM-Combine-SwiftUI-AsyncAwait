//
//  View+Extensions.swift
//  City Search
//
//  Created by Feridun Erbas on 31.03.2022.
//

import SwiftUI

extension View {
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
}
