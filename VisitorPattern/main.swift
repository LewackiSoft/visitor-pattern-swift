//
// Created by Tomasz Stachowiak on 25.03.21.
// Copyright (c) 2021 Tomek. All rights reserved.
//

import Foundation


let company = Department(
        id: "Main",
        ownCost: 10,
        subDepartments: [
            Department(id: "Low Cost", ownCost: 20),
            WeirdDepartment(id: "IT", ownCost: 20, weirdness: 1.5, subDepartments: [
                Department(id: "QA", ownCost: 100),
                Department(id: "Dev", ownCost: 200),
            ])
        ])

company.accept(visitor: TreePrintingVisitor(indent: 2))

print("\n===================\n")

let itCosts = company
        .accept(visitor: DepartmentSearchVisitor {
            $0.id == "IT"
        })?
        .accept(visitor: CostCountingVisitor()) ?? 0

print("IT Costs:", itCosts)
print("Total Costs:", company.accept(visitor: CostCountingVisitor()))
