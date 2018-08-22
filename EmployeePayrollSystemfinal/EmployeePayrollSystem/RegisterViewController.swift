//
//  RegisterViewController.swift
//  EmployeePayrollSystem
//
//  Created by MacStudent on 2018-08-09.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit
import SQLite3

class RegisterViewController: UIViewController {
    var db: OpaquePointer?
    var registerArray: [SignUp] = [SignUp]()
    
    @IBOutlet weak var nameRegister: UITextField!
    
    @IBOutlet weak var emailIdRegister: UITextField!
    
    @IBOutlet weak var passwordRegister: UITextField!
    
    @IBOutlet weak var cnfPasswordRegister: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readValues()
        let fileUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("SignUpDatabase.sqlite")
        
        if sqlite3_open(fileUrl.path, &db) != SQLITE_OK{
            self.title = "hello mohit"
            print("error opening meassage")
            return
        }
        
        //        let createTableQuery = "CREATE TABLE IF NOT EXISTS Signup (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT, email TEXT, password TEXT, cnfpassword TEXT )"
        
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS Signup (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT, email TEXT, password TEXT, cnfpassword TEXT )", nil,nil,nil) != SQLITE_OK{
            print("error createing table ")
            return
        }
        print("good")
        readValues()
    }

        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     }
    

    @IBAction func buttonRegister(_ sender: Any) {
        //getting values from textfields
       let name = nameRegister.text
       let email = emailIdRegister.text
        let password = passwordRegister.text
        let cnfPassword = cnfPasswordRegister.text
       //validating that values are not empty
        if (name?.isEmpty)! || (email?.isEmpty)! || (password?.isEmpty)!  || (cnfPassword?.isEmpty)! {
       let myAlert = UIAlertController(title: "Alert", message: "all fields are required", preferredStyle: UIAlertControllerStyle.alert)
                 let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
                  myAlert.addAction(okAction)
            self.present(myAlert,animated: true, completion: nil); return
       }
         //pass word validation
        if (password != cnfPassword) {
            let myAlert = UIAlertController(title: "Alert", message: "password do not match", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
            myAlert.addAction(okAction)
            self.present(myAlert,animated: true, completion: nil); return
        }
        //creating a statement
        var stmt: OpaquePointer?
        //the insert query
        let insertQuery = "INSERT INTO Signup (name, email, password, cnfpassword) VALUES(?,?,?,?)"
        //preparing the query
      if sqlite3_prepare(db, insertQuery, -1, &stmt, nil) != SQLITE_OK{
           print("error bindind Query")
           return
           }
//        if sqlite3_bind_text(stmt, 1, name, -1, nil) != SQLITE_OK{
//            print("mohit")
//        }
        //binding the parameters
     if sqlite3_bind_text(stmt, 1, name, -1, nil) != SQLITE_OK {
           print("error bind name")
       return
        }
        
        if sqlite3_bind_text(stmt, 2, email, -1, nil) != SQLITE_OK {
         print("error bind email")
            return
         }

        if sqlite3_bind_text(stmt, 3, password, -1, nil) != SQLITE_OK {
            print("error bind password"); return
         }
    
         if sqlite3_bind_text(stmt, 4, cnfPassword, -1, nil) != SQLITE_OK {
            print("error bind cnfpassword"); return
        }
        //executing the query to insert values
        if sqlite3_step(stmt) == SQLITE_DONE{
            print("data saved")
            let myAlert = UIAlertController(title: "Alert", message: "SignUp Sucessfully!! Move to login Screen", preferredStyle: UIAlertControllerStyle.alert)
                       let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
                       myAlert.addAction(okAction)
            self.present(myAlert,animated: true, completion: nil);
          }
        
        //emptying the textfields
        nameRegister.text = ""
        emailIdRegister.text = ""
        passwordRegister.text = ""
        cnfPasswordRegister.text = ""
        
        readValues()
        }
    
    @IBAction func buttonAlreadyAccount(_ sender: Any) {
        //let alreadyAccountViewController = storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
        //self.present(alreadyAccountViewController, animated: true, completion: nil)
        performSegue(withIdentifier: "DVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using
        if let displayVC = segue.destination as? LoginViewController
        {
            displayVC.registerArray = registerArray
            
        }
    }
    
    
    func readValues(){
       
        //first empty the list of register
        registerArray.removeAll()
        
        //this is our select query
        let queryString = "SELECT * FROM Signup"
        
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
            let name = String(cString: sqlite3_column_text(stmt, 1))
            let email = String(cString: sqlite3_column_text(stmt, 2))
            let password = String(cString: sqlite3_column_text(stmt, 3))
            let cnfpassword = String(cString: sqlite3_column_text(stmt, 4))
            //adding values to list
            registerArray.append(SignUp(id: Int(id), empName: String(describing: name), empEmailId: String(describing: email), empPassword: String(describing: password), cnfPassword: String(describing: cnfpassword)))
            }
        print(registerArray.count)
        }
    
    

}
