//
// Created by Tomasz Stachowiak on 25.03.21.
// Copyright (c) 2021 Tomek. All rights reserved.
//

import Foundation


let company = Department(
        id: "Main",
        ownCost: 100,
        subDepartments: [
            Department(id: "Low cost department", ownCost: 20),
            Department(id: "Some other low cost dept", ownCost: 20),
            WeirdDepartment(id: "IT", ownCost: 50, weirdness: 1.5, subDepartments: [
                Department(id: "QA", ownCost: 100),
                Department(id: "Dev", ownCost: 200),
            ])
        ])

company.accept(visitor: TreePrintingVisitor(indent: 2))

print("\n===================\n")

let itCosts = company
        .accept(visitor: DepartmentFilterVisitor {
            $0.id == "IT"
        })
        .first?
        .accept(visitor: CostCountingVisitor()) ?? 0

print("IT Costs:", itCosts)
print("Total Costs:", company.accept(visitor: CostCountingVisitor()))

let lowCost = company.accept(visitor: DepartmentFilterVisitor {
    $0.ownCost < 50
})

print("Low cost departments:")
for department in lowCost {
    print(" -", "\(department.id):", department.ownCost)
}

