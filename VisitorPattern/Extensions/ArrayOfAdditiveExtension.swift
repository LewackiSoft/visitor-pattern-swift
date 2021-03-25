//
// Created by Tomasz Stachowiak on 25.03.21.
// Copyright (c) 2021 Tomek. All rights reserved.
//

import Foundation


extension Array where Array.Element: AdditiveArithmetic {
    func sum() -> Array.Element {
        self.reduce(Array.Element.zero) {
            $0 + $1
        }
    }
}
