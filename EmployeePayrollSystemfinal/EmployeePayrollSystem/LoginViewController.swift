//
//  LoginViewController.swift
//  EmployeePayrollSystem
//
//  Created by MacStudent on 2018-08-09.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
//var signUpData = [SignUp]()
    var registerArray: [SignUp] = [SignUp]()
    //var registerArray: [SignUp]!
    @IBOutlet weak var textLoginEmail: UITextField!
    
    @IBOutlet weak var textLoginPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("what's in the array?")
        print(self.registerArray)
        print("------")
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        }
    

    @IBAction func buttonLogin(_ sender: Any) {
        for j in 0...registerArray.count - 1 {
           if (textLoginPassword.text! == registerArray[j].empPassword )
            //if (textLoginPassword.text == "mohit" && textLoginEmail.text == "123" )
            {
                print("array works")
                print("\(registerArray[j].id)")
                print("\(registerArray.count)")
                           print("\(textLoginEmail.text!)")
                        print("\(textLoginPassword.text!)")
                           print("\(registerArray[j].empPassword)")
                         print("\(registerArray[j].empEmailId)")
                performSegue(withIdentifier: "tohomeVC", sender: self)
                return

                }  }
        if (textLoginPassword.text! != registerArray[registerArray.count-1].empPassword ){
            print("User Email / Password incorrect")
//            print("\(registerArray[j].id)")
//            print("\(textLoginEmail.text!)")
//            print("\(textLoginPassword.text!)")
//            print("\(registerArray[j].empPassword)")
//            print("\(registerArray[j].empEmailId)")
            let myAlert = UIAlertController(title: "Alert", message: "Email Either Password Incorrect!!", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
            myAlert.addAction(okAction)
            self.present(myAlert,animated: true, completion: nil)
            }
        
    }
    
    
    @IBAction func buttonRegister(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let registerViewController = storyboard?.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        self.present(registerViewController, animated: true, completion: nil)
    }
    
}
