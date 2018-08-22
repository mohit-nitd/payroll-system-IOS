//
//  EmployeeClass.swift
//  EmployeePayrollSystem
//
//  Created by MacStudent on 2018-08-16.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import Foundation
// calender code for current year
let date = Date()
let calendar = Calendar.current
// current year extracation from date component
let currentYear = calendar.component(.year, from: date)


// Created Employee Class

class Employee: IPrintable {
   
    var employeeName: String?
    var type: String?
    var age: Int?
    var vehicle: Vehicle?
    var employeeId: Int?
    
    //init(employeeName: String, age: Int, employeeId: Int ) {
    //self.employeeName = employeeName
    //self.age = age
    //self.employeeId = employeeId
    //self.vehicle = vehicle
    // }
    
    
    
    
    func calBirthYear() -> Int {
        return currentYear - age!
    }
    
    func printMyData() {
        print("Name of Employee is = \(employeeName!) \nYear of Birth of Employee = \(calBirthYear()) \nEmployee Id is =  \(employeeId!) ")
        
    }
    
    
}
