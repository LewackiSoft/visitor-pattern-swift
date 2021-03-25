//
// Created by Tomasz Stachowiak on 25.03.21.
// Copyright (c) 2021 Tomek. All rights reserved.
//

import Foundation


protocol WeirdDepartmentProtocol: DepartmentProtocol {
    var weirdness: Float { get }
}

extension WeirdDepartmentProtocol {
    func accept<V: DepartmentVisitorProtocol>(visitor: V) -> V.ValueType {
        return visitor.visit(weirdDepartment: self)
    }
}
