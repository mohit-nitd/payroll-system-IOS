//
//  PartTime.swift
//  EmployeePayrollSystem
//
//  Created by MacStudent on 2018-08-16.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import Foundation
class PartTime: Employee {
    var numberOfHoursWorked: Int?
    var rate: Int?
    
    
    
    
    func printMydata()  {
        super.printMyData()
        print("Number of Hours Worked By Employee =  \(numberOfHoursWorked!) \nWage Rate Of Employee = \(rate!) ")
    }
    
    
}
