//
//  FullTime.swift
//  EmployeePayrollSystem
//
//  Created by MacStudent on 2018-08-16.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import Foundation
class FullTimeEmployee: Employee {
    var salary: Double?
    var bonus: Double?
    
    
    func calcEarning() -> Double {
        return salary!*((100+bonus!)/100)
    }
    
    
    
    
    
    override func printMyData() {
        super.printMyData()
        print("Employee Type is Full Time")
        print("Employee total Salary is =  \(calcEarning())")
        
    }
    
    
}
