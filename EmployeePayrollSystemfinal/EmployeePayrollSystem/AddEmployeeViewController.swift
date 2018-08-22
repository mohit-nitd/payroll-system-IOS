//
//  AddEmployeeViewController.swift
//  EmployeePayrollSystem
//
//  Created by MacStudent on 2018-08-15.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit
import SQLite3

class AddEmployeeViewController: UIViewController {
    var db : OpaquePointer?
    
    var internArray: [Intern] = [Intern]()
    var fullTimeArray: [FullTimeEmployee] = [FullTimeEmployee]()
    var cbptArray: [CommisionBasedPartTime] = [CommisionBasedPartTime]()
    var fbptArray: [FixedBasePartTime] = [FixedBasePartTime]()
    
    @IBOutlet weak var textEmployeeId: UITextField!
    @IBOutlet weak var textEmployeeName: UITextField!
    @IBOutlet weak var employeeAge: UITextField!
    @IBOutlet weak var enterPlate: UITextField!
    @IBOutlet weak var enterMake: UITextField!
    @IBOutlet weak var textVehicleAttribute: UITextField!
    @IBOutlet weak var textSchool: UITextField!
    @IBOutlet weak var textStipend: UITextField!
    
    @IBOutlet weak var hoursFBPT: UITextField!
    @IBOutlet weak var rateFBPT: UITextField!
    @IBOutlet weak var salaryFBPT: UITextField!
    @IBOutlet weak var commssionFullTime: UITextField!
    @IBOutlet weak var salaryFullTime: UITextField!
    @IBOutlet weak var textFBPT: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        let fileUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("AddEmployee.sqlite")
        if sqlite3_open(fileUrl.path, &db) != SQLITE_OK{
            self.title = "hello mohit"
            print("error opening meassage")
            return
        }
        if sqlite3_exec(db, "DROP TABLE IF EXISTS AddEmployee", nil, nil, nil) != SQLITE_OK{
            print("deletrd")
        }
        
    if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS AddEmployee (id INTEGER PRIMARY KEY AUTOINCREMENT, employeeid INTEGER, name TEXT, age INTEGER, make TEXT, plate TEXT, attribute TEXT, stipend INTEGER, schoolname TEXT, salary INTEGER, commissionpercentage FLOAT, hoursworked INTEGER, fixedsalary FLOAT, rate INTEGER )", nil,nil,nil) != SQLITE_OK{
            print("error createing table ")
            return
        }
        
        print("good")
        enterMake.isEnabled = false
        enterPlate.isEnabled = false
        internView.isHidden = false
       fullTimeView.isHidden = true
       fbptView.isHidden = true
        readValues()
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var VehicleOption: UISegmentedControl!
    
    @IBAction func vehicleAttribute(_ sender: Any) {
        switch VehicleOption.selectedSegmentIndex {
        case 0:
          enterMake.isEnabled = false
            enterPlate.isEnabled = false
            case 1:
            enterPlate.isEnabled = true
            enterMake.isEnabled = true
            
        default:
            break
        }
        }
    
    @IBOutlet weak var vehicleSegment: UISegmentedControl!
    @IBAction func vehicleSwitch(_ sender: Any) {
        
        switch vehicleSegment.selectedSegmentIndex {
        case 0:
            textVehicleAttribute.placeholder = "enter car colour"
            
        case 1:
           textVehicleAttribute.placeholder = "enter bike weight"
           
        default:
            break;
        }
        }
    
    @IBOutlet weak var employeeType: UISegmentedControl!
    @IBOutlet weak var internView: UIView!
    @IBOutlet weak var fullTimeView: UIView!
    @IBOutlet weak var fbptView: UIView!
    
   
    @IBOutlet weak var fbptFixedSalary: UITextField!
    @IBOutlet weak var fbptRate: UITextField!
    @IBOutlet weak var fbptHours: UITextField!
    @IBAction func employeeTypeSegment(_ sender: Any) {
        switch employeeType.selectedSegmentIndex {
        case 0:
         internView.isHidden = false
         fullTimeView.isHidden = true
         fbptView.isHidden = true
         //cbptView.isHidden = true
            break
        case 1:
            fullTimeView.isHidden = false
            internView.isHidden = true
            fbptView.isHidden = true
            //cbptView.isHidden = true
            break
        case 2:
            fbptView.isHidden = false
            internView.isHidden = true
            fullTimeView.isHidden = true
            fbptFixedSalary.placeholder = " Enter Fixed Salary"
            //cbptView.isHidden = true
            break
        case 3:
           // cbptView.isHidden = false
            internView.isHidden = true
            fbptView.isHidden = false
            fullTimeView.isHidden = true
            fbptFixedSalary.placeholder = "Enter Commision %"
            break
        
        default:
            break
        }
        }
    
    @IBAction func buttonAction(_ sender: Any) {
       
        let name = textEmployeeName.text
        let employeeid = textEmployeeId.text
        let age = employeeAge.text
        let make = enterMake.text
        let  plate = enterPlate.text
        let attribute = textVehicleAttribute.text
        let stipend = textStipend.text!
        let schoolname = textSchool.text
        let salary = salaryFullTime.text
        let commissionpercentage = commssionFullTime.text!
        let fixedsalary = fbptFixedSalary.text!
        let hoursworked = hoursFBPT.text!
        let rate = rateFBPT.text!
      
        
        
       
        // id INTEGER PRIMARY KEY AUTOINCREMENT, employeeid INTEGER, name TEXT, age INTEGER, make TEXT, plate TEXT, attribute TEXT, stipend INTEGER, schoolname TEXT, salary INTEGER, commissionpercentage FLOAT, //hoursworked INTEGER, fixedsalary FLOAT, rate INTEGER
        //creating a statement
        var stmt: OpaquePointer?
        
        //the insert query
        let queryString = "INSERT INTO AddEmployee ( employeeid, name ,age ,make ,plate ,attribute ,stipend ,schoolname ,salary , commissionpercentage , hoursworked , fixedsalary , rate ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)"
        //preparing the query
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            print("error bindind Query"); return;
            
        }
        
        //binding the parameters
        if sqlite3_bind_int(stmt, 1, (employeeid! as NSString).intValue) != SQLITE_OK {
            print("error bind email")
            return;
        }
        
        //binding the parameters
        if sqlite3_bind_text(stmt, 2, name, -1, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding name: \(errmsg)")
            return
        }
        if sqlite3_bind_int(stmt, 3,(age! as NSString).intValue) != SQLITE_OK {
            print("error bind email")
            return
        }
        
        if sqlite3_bind_text(stmt, 4, make, -1, nil) != SQLITE_OK {
            print("error bind email")
            return
        }
        
        if sqlite3_bind_text(stmt, 5, plate, -1, nil) != SQLITE_OK {
            print("error bind email")
            return
        }
        if sqlite3_bind_text(stmt, 6, attribute, -1, nil) != SQLITE_OK {
            print("error bind email")
            return
        }
        if sqlite3_bind_int(stmt, 7, (stipend as NSString).intValue) != SQLITE_OK {
            print("error bind email")
            return
        }
        if sqlite3_bind_text(stmt, 8, schoolname, -1, nil) != SQLITE_OK {
            print("error bind email")
            return
        }
        if sqlite3_bind_text(stmt, 9, salary, -1, nil) != SQLITE_OK {
            print("error bind email")
            return
        }
        if sqlite3_bind_int(stmt, 10,(commissionpercentage as NSString).intValue) != SQLITE_OK {
            print("error bind email")
            return
        }
        if sqlite3_bind_int(stmt, 11, (fixedsalary as NSString).intValue)  != SQLITE_OK {
            print("error bind email")
            return
        }
        if sqlite3_bind_int(stmt, 12, (hoursworked as NSString).intValue)   != SQLITE_OK {
            print("error bind email")
            return
        }
        if sqlite3_bind_int(stmt, 13, (rate as NSString).intValue) != SQLITE_OK {
            print("error bind email")
            return
        }
        //executing the query to insert values
        if sqlite3_step(stmt) == SQLITE_DONE{
            print("data saved")
            let myAlert = UIAlertController(title: "Alert", message: "Data saved", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
            myAlert.addAction(okAction)
            self.present(myAlert,animated: true, completion: nil);
        }
        readValues()
        //switch end here
        }
   
    func readValues(){
        
        //first empty the list of register
//       internArray.removeAll()
//        fullTimeArray.removeAll()
//        cbptArray.removeAll()
//        fbptArray.removeAll()
        
        //this is our select query
        let queryString = "SELECT * FROM AddEmployee "
        
        //statement pointer
        var stmt:OpaquePointer?
        
        //preparing the query
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        
        //traversing through all the records
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let id = sqlite3_column_int(stmt, 0)
            let name = String(cString: sqlite3_column_text(stmt, 2))
            let employeeid =  sqlite3_column_int(stmt, 1)
            let age = sqlite3_column_int(stmt, 3)
            let make = String(cString: sqlite3_column_text(stmt, 4))
            let  plate = String(cString: sqlite3_column_text(stmt, 5))
            let attribute = String(cString: sqlite3_column_text(stmt, 6))
            let stipend = sqlite3_column_int(stmt, 7)
            let schoolname = String(cString: sqlite3_column_text(stmt, 8))
            let salary = sqlite3_column_double(stmt, 9)
            let commissionpercentage = sqlite3_column_double(stmt, 10)
            let fixedsalary = sqlite3_column_double(stmt, 11)
            let hoursworked = sqlite3_column_int(stmt, 12)
            let rate = sqlite3_column_int(stmt, 13)
            
           switch employeeType.selectedSegmentIndex {
            case 0:
                let intern = Intern()
                intern.employeeName = name
                intern.employeeId = Int(employeeid)
                intern.age = Int(age)
                intern.internSchoolName = schoolname
                intern.stipend = Int(stipend)
                if VehicleOption.selectedSegmentIndex == 0{
                    intern.vehicle = nil
                }else{
                    if vehicleSegment.selectedSegmentIndex == 0{
                        let car = Car()
                        car.make = make
                        car.plate = plate
                        car.numberOfSeats = Int(attribute)
                        intern.vehicle = car
                    }else {
                       let  motorcycle = Motorcycle()
                        motorcycle.make = make
                        motorcycle.plate = plate
                        motorcycle.getKerbWeight = Int(attribute)
                        intern.vehicle = motorcycle
                    }  }
                internArray.append(intern)
                break
            case 1:
                let fullTime = FullTimeEmployee()
                fullTime.employeeName = name
                fullTime.employeeId = Int(employeeid)
                fullTime.age = Int(age)
                fullTime.salary = Double(salary)
                fullTime.bonus = Double(commissionpercentage)
            if VehicleOption.selectedSegmentIndex == 0{
                   fullTime.vehicle = nil
               }else{
                    if vehicleSegment.selectedSegmentIndex == 0{
                        let car = Car()
                        car.make = make
                        car.plate = plate
                        car.numberOfSeats = Int(attribute)
                        fullTime.vehicle = car
                   }else {
                        let motorcycle = Motorcycle()
                        motorcycle.make = make
                        motorcycle.plate = plate
                        motorcycle.getKerbWeight = Int(attribute)
                        fullTime.vehicle = motorcycle
                    }  }
                fullTimeArray.append(fullTime)
                break
           // case 2:
                let fixedPasePartTime = FixedBasePartTime()
                
                fixedPasePartTime.employeeName = name
                fixedPasePartTime.employeeId = Int(employeeid)
                fixedPasePartTime.age = Int(age)
                fixedPasePartTime.fixedAmount = Int(fixedsalary)
                fixedPasePartTime.numberOfHoursWorked = Int(hoursworked)
                fixedPasePartTime.rate =  Int(rate)
//                //if VehicleOption.selectedSegmentIndex == 0{
//                    fixedPasePartTime.vehicle = nil
//               // }else{
//                  //  if vehicleSegment.selectedSegmentIndex == 0{
//                        let car = Car()
//                        car.make = make
//                        car.plate = plate
//                        car.numberOfSeats = Int(attribute)
//                        fixedPasePartTime.vehicle = car
//                   // }else {
//                        let motorcycle = Motorcycle()
//                        motorcycle.make = make
//                        motorcycle.plate = plate
//                        motorcycle.getKerbWeight = Int(attribute)
//                    fixedPasePartTime.vehicle = motorcycle
//                   // }  }
                fbptArray.append(fixedPasePartTime)
                break
//            case 3:
//                let  commssionBasedpartTime = CommisionBasedPartTime()
//                commssionBasedpartTime.employeeName = name
//                commssionBasedpartTime.employeeId = Int(employeeid)
//                commssionBasedpartTime.age =  Int(age)
//                commssionBasedpartTime.commisionPercentage = Double(fixedsalary)
//                commssionBasedpartTime.numberOfHoursWorked = Int(hoursworked)
//                commssionBasedpartTime.rate = Int(rate)
//                if VehicleOption.selectedSegmentIndex == 0{
//                    commssionBasedpartTime.vehicle = nil
//                }else{
//                    if vehicleSegment.selectedSegmentIndex == 0{
//                        let car = Car()
//                        car.make = make
//                        car.plate = plate
//                        car.numberOfSeats = Int(attribute)
//                        commssionBasedpartTime.vehicle = car
//                    }else {
//                        let motorcycle = Motorcycle()
//                        motorcycle.make = make
//                        motorcycle.plate = plate
//                        motorcycle.getKerbWeight = Int(attribute)
//                        commssionBasedpartTime.vehicle = motorcycle
//                    }  }
//                cbptArray.append(commssionBasedpartTime)
//                break
            default:
               break;
           }
            
            }

    }
   
    
    
    
    
    
    @IBAction func btn(_ sender: Any) {
        
        performSegue(withIdentifier: "LDVC", sender: self)
    }
    
    
   
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let displayVCD = segue.destination as? DispalyEmployeeViewController{
            
            displayVCD.cbptArray = cbptArray
            displayVCD.fbptArray = fbptArray
            displayVCD.internArray = internArray
            displayVCD.fullTimeArray = fullTimeArray
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
// class end here
}
