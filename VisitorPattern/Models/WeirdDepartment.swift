//
// Created by Tomasz Stachowiak on 25.03.21.
// Copyright (c) 2021 Tomek. All rights reserved.
//

import Foundation


class WeirdDepartment: WeirdDepartmentProtocol {
    let id: String
    let weirdness: Float
    let ownCost: Float
    let subDepartments: [DepartmentProtocol]?

    init(_ id: String, ownCost: Float, weirdness: Float, subDepartments: [DepartmentProtocol]? = nil) {
        self.id = id
        self.ownCost = ownCost
        self.weirdness = weirdness
        self.subDepartments = subDepartments
    }
}
