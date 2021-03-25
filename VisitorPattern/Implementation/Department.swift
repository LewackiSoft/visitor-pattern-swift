//
// Created by Tomasz Stachowiak on 25.03.21.
// Copyright (c) 2021 Tomek. All rights reserved.
//

import Foundation

class Department: DepartmentProtocol {
    let id: String
    let ownCost: Float
    let subDepartments: [DepartmentProtocol]?

    init(_ id: String, ownCost: Float, subDepartments: [DepartmentProtocol]? = nil) {
        self.id = id
        self.ownCost = ownCost
        self.subDepartments = subDepartments
    }
}
