//
// Created by Tomasz Stachowiak on 25.03.21.
// Copyright (c) 2021 Tomek. All rights reserved.
//

import Foundation


class DepartmentFilterVisitor {
    private let predicate: (DepartmentProtocol) -> Bool

    init(predicate: @escaping (DepartmentProtocol) -> Bool) {
        self.predicate = predicate
    }
}


extension DepartmentFilterVisitor: DepartmentVisitorProtocol {
    func visit(department: DepartmentProtocol) -> [DepartmentProtocol] {
        var results = [DepartmentProtocol]()

        if self.predicate(department) {
            results.append(department)
        }

        if let subDepartments = department.subDepartments {
            results.append(contentsOf: subDepartments.flatMap {
                $0.accept(visitor: self)
            })
        }

        return results;
    }

    func visit(weirdDepartment: WeirdDepartmentProtocol) -> [DepartmentProtocol] {
        visit(department: weirdDepartment)
    }
}
