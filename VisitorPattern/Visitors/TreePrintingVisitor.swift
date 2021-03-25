//
// Created by Tomasz Stachowiak on 25.03.21.
// Copyright (c) 2021 Tomek. All rights reserved.
//

import Foundation

class TreePrintingVisitor {
    let indentWidth: UInt8
    private var currentDepth: UInt8 = 0

    init(indent: UInt8 = 2) {
        self.indentWidth = indent
    }
}

extension TreePrintingVisitor: DepartmentVisitorProtocol {
    func visit(department: DepartmentProtocol) -> Void {
        innerVisit(department: department, extraInfo: "\(department.ownCost)")
    }

    func visit(weirdDepartment: WeirdDepartmentProtocol) -> Void {
        innerVisit(
                department: weirdDepartment,
                extraInfo: "\(weirdDepartment.ownCost)"
                        + " weirdness: \(weirdDepartment.weirdness)"
        )
    }

    private func innerVisit(
            department: DepartmentProtocol,
            extraInfo: String? = nil
    ) {
        let indent = String(
                repeating: " ",
                count: (Int)(currentDepth * indentWidth)
        )

        print(
                indent,
                department.id,
                extraInfo != nil ? ": \(extraInfo!)" : "",
                separator: ""
        )

        self.currentDepth += 1

        department.subDepartments?.forEach {
            $0.accept(visitor: self)
        }

        self.currentDepth -= 1
    }
}
