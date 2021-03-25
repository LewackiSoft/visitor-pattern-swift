//
// Created by Tomasz Stachowiak on 25.03.21.
// Copyright (c) 2021 Tomek. All rights reserved.
//

import Foundation


protocol DepartmentVisitorProtocol {
    associatedtype ValueType
    func visit(department: DepartmentProtocol) -> ValueType
    func visit(weirdDepartment: WeirdDepartmentProtocol) -> ValueType
}

