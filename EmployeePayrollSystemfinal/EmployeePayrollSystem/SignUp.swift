//
//  SignUp.swift
//  EmployeePayrollSystem
//
//  Created by MacStudent on 2018-08-09.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import Foundation

//var registerArray: [SignUp] = [SignUp]()

class SignUp {
      var id: Int = 0
      var empName: String = ""
      var empEmailId: String = ""
      var empPassword: String = ""
      var cnfPassword: String = ""
    
    init(id: Int, empName: String, empEmailId: String, empPassword: String, cnfPassword: String){
        self.id = id
        self.empName = empName
        self.empEmailId = empEmailId
        self.empPassword = empPassword
        self.cnfPassword = cnfPassword
    }
    
}
