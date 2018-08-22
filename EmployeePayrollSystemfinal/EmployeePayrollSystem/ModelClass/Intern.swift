//
//  Intern.swift
//  EmployeePayrollSystem
//
//  Created by MacStudent on 2018-08-16.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import Foundation
class Intern: Employee  {
    var internSchoolName: String?
    var stipend: Int?
   
    
    
    
    func calcEarning() -> Int {
        return stipend!
    }
    
    override func  printMyData() {
        super.printMyData()
        print("Employee is Intern Type")
        print("Intern School name is \(internSchoolName!)")
        print("Intern total salary is \(stipend!)")
        
        
    }
    
    
}
