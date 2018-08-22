//
//  Car.swift
//  EmployeePayrollSystem
//
//  Created by MacStudent on 2018-08-16.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import Foundation
class Car: Vehicle
{
    var numberOfSeats: Int?
    
    
    
    override func printMyData() {
        print("Employee Has a CAR")
        super.printMyData()
        print("car is = \(numberOfSeats!)\t Seater")
    }
}
