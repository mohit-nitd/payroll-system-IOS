//
//  FixedBasePartTime.swift
//  EmployeePayrollSystem
//
//  Created by MacStudent on 2018-08-16.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import Foundation
class FixedBasePartTime: PartTime {
    var fixedAmount: Int?
    
    override init() {
        
    }
    
    
    func calcEarning() -> Int {
        
        return (rate!*numberOfHoursWorked!) + (fixedAmount!)
    }
    
    override func printMyData() {
        
        super.printMydata()
        print("Employee is PartTime / Fixed Amt")
        print("Total Earning is \(calcEarning())")
        
        
    }
    
}
