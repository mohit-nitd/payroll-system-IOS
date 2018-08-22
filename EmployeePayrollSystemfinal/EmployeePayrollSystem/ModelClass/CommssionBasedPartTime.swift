//
//  CommssionBasedPartTime.swift
//  EmployeePayrollSystem
//
//  Created by MacStudent on 2018-08-16.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import Foundation
class CommisionBasedPartTime: PartTime {
    var commisionPercentage: Double?
  
    
    
    func calcEarnings() -> Double {
        return (Double)(numberOfHoursWorked!*rate!) + ((Double(numberOfHoursWorked!*rate!))*(commisionPercentage!/100))
    }
    
    
    
    
    override func printMyData() {
        super.printMydata()
        print("Employee is Commision Based Part Time")
        print("Total Earning is \(calcEarnings())")
        
        
    }
    
    
    
    
}
