//
// Created by Tomasz Stachowiak on 25.03.21.
// Copyright (c) 2021 Tomek. All rights reserved.
//

import Foundation


struct Department: DepartmentProtocol {
    let id: String
    let ownCost: Float
    private(set) var subDepartments: [DepartmentProtocol]? = nil
}
