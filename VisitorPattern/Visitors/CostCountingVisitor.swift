//
// Created by Tomasz Stachowiak on 25.03.21.
// Copyright (c) 2021 Tomek. All rights reserved.
//

import Foundation

class CostCountingVisitor: DepartmentVisitorProtocol {
    typealias ValueType = Float

    func visit(department: DepartmentProtocol) -> Float {
        let subTotal = department
                .subDepartments?
                .map {
                    $0.accept(visitor: self)
                }
                .sum()

        return department.ownCost + (subTotal ?? 0);
    }

    func visit(weirdDepartment: WeirdDepartmentProtocol) -> Float {
        let subTotal = weirdDepartment
                .subDepartments?
                .map {
                    $0.accept(visitor: self)
                }
                .sum()

        return weirdDepartment.ownCost
                + weirdDepartment.weirdness
                * (subTotal ?? 0);
    }
}
