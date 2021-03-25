//
// Created by Tomasz Stachowiak on 25.03.21.
// Copyright (c) 2021 Tomek. All rights reserved.
//

import Foundation


protocol DepartmentProtocol {
    var id: String { get }
    var subDepartments: [DepartmentProtocol]? { get }
    var ownCost: Float { get }

    func accept<V: DepartmentVisitorProtocol>(visitor: V) -> V.ValueType;
}

extension DepartmentProtocol {
    func accept<V: DepartmentVisitorProtocol>(visitor: V) -> V.ValueType {
        visitor.visit(department: self)
    }
}
