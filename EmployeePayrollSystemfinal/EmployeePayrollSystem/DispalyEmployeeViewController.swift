//
//  DispalyEmployeeViewController.swift
//  EmployeePayrollSystem
//
//  Created by MacStudent on 2018-08-20.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit


class DispalyEmployeeViewController: UIViewController {
    
    
    var internArray: [Intern] = [Intern]()
    var fullTimeArray: [FullTimeEmployee] = [FullTimeEmployee]()
    var cbptArray: [CommisionBasedPartTime] = [CommisionBasedPartTime]()
    var fbptArray: [FixedBasePartTime] = [FixedBasePartTime]()
    
   
    
    @IBOutlet weak var textEnterId: UITextField!
    @IBOutlet weak var lablname: UILabel!
    
    @IBOutlet weak var lblyear: UILabel!
    
    @IBOutlet weak var lblrate: UILabel!
    
    @IBOutlet weak var lblhours: UILabel!
    
    
    @IBOutlet weak var lblsalary: UILabel!
    
    
    @IBOutlet weak var lblcarmotor: UILabel!
    
    
    @IBOutlet weak var lblplate: UILabel!
    @IBOutlet weak var lblmake: UILabel!
    
    @IBOutlet weak var lblattribue: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
         print(self.internArray)
        print(self.fullTimeArray)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnDetails(_ sender: Any) {
        for j in 0...internArray.count-1{
            if (internArray[j].employeeId == Int(textEnterId.text!)){
                lablname.text = internArray[j].employeeName
                lblyear.text = String(internArray[j].calBirthYear())
                lblrate.text = String(internArray[j].stipend!)
                lblhours.text = String(internArray[j].internSchoolName!)
                lblsalary.isHidden = true
                if internArray[j].vehicle == nil{
                    lblmake.text = "employee has no vehicle"
                }else{
                    lblmake.text = "make is \(internArray[j].vehicle?.make! ?? "BMW")"
                    lblplate.text = "plate is \(internArray[j].vehicle?.plate! ?? "mohit1892")"
                }}
            else{
                print("not found") }
            for j in 0...fullTimeArray.count-1{
                if (fullTimeArray[j].employeeId == Int(textEnterId.text!)){
                    lablname.text = fullTimeArray[j].employeeName
                    lblyear.text = String(fullTimeArray[j].calBirthYear())
                    lblrate.text = String(fullTimeArray[j].bonus!)
                    lblhours.text = String(fullTimeArray[j].calcEarning())
                    lblsalary.isHidden = true
                    if fullTimeArray[j].vehicle == nil{
                        lblmake.text = "employee has no vehicle"
                    }else{
                        lblmake.text = "make is \(fullTimeArray[j].vehicle?.make! ?? "BMW")"
                        lblplate.text = "plate is \(fullTimeArray[j].vehicle?.plate! ?? "mohit1892")"
                    }
                }else{
                    print("not found") }
                
            }
        }
           
        
        
        
        
    }
    
    









// class ends here
}


































