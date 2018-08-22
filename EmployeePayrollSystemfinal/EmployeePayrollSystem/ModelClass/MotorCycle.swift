//
//  MotorCycle.swift
//  EmployeePayrollSystem
//
//  Created by MacStudent on 2018-08-16.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import Foundation
class Motorcycle: Vehicle
{
    var getKerbWeight: Int?
    
    
    
    override func printMyData()
    {
        print("Employee Has a Motorcycle")
        super.printMyData()
        print("Weight of MotorCycle is = \(getKerbWeight!)")
    }
}
