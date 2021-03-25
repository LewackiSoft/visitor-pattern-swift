//
// Created by Tomasz Stachowiak on 25.03.21.
// Copyright (c) 2021 Tomek. All rights reserved.
//

import Foundation


class DepartmentSearchVisitor {
    private let predicate: (DepartmentProtocol) -> Bool

    init(predicate: @escaping (DepartmentProtocol) -> Bool) {
        self.predicate = predicate
    }
}


extension DepartmentSearchVisitor: DepartmentVisitorProtocol {
    func visit(department: DepartmentProtocol) -> DepartmentProtocol? {
        if self.predicate(department) {
            return department;
        }

        guard let subDepartments = department.subDepartments,
              !subDepartments.isEmpty else {
            return nil
        }

        for department in subDepartments {
            if let res = department.accept(visitor: self) {
                return res
            }
        }

        return nil
    }

    func visit(weirdDepartment: WeirdDepartmentProtocol) -> DepartmentProtocol? {
        visit(department: weirdDepartment)
    }
}
