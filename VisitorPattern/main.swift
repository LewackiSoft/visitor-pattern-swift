//
// Created by Tomasz Stachowiak on 25.03.21.
// Copyright (c) 2021 Tomek. All rights reserved.
//

import Foundation


let company = Department(
        "Main",
        ownCost: 10,
        subDepartments: [
            Department("Low Cost", ownCost: 20),
            WeirdDepartment("IT", ownCost: 20, weirdness: 1.5, subDepartments: [
                Department("QA", ownCost: 100),
                Department("Dev", ownCost: 200),
            ])
        ])

let itCosts = company
        .accept(visitor: DepartmentSearchVisitor(searchId: "IT"))?
        .accept(visitor: CostCountingVisitor()) ?? 0


company.accept(visitor: TreePrintingVisitor(indent: 2))

print("\n===================\n")

print("IT Costs:", itCosts)
print("Total Costs:", company.accept(visitor: CostCountingVisitor()))
