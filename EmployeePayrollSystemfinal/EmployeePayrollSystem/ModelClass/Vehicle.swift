//
//  Vehicle.swift
//  EmployeePayrollSystem
//
//  Created by MacStudent on 2018-08-16.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import Foundation
// vehicle class implementing IPrintable Protocol
class Vehicle: IPrintable
{
    var make: String?
    var plate: String?
    
    
    func printMyData() {
        print("Make Of car is = \(make!) \nPlate of car is = \(plate!)")
    }
}
