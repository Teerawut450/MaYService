//
//  RegisterViewController.swift
//  MayService
//
//  Created by TST-APP-01 on 24/1/2562 BE.
//  Copyright © 2562 Teerawut. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    //Explicit
    var name: String?
    var user: String?
    var pass: String?
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    } //Main Method
    
    
    @IBAction func uploadButton(_ sender: UIBarButtonItem) {
        
        //Get value from TextField
        name = nameTextField.text
        user = userTextField.text
        pass = passTextField.text
        
        //Show Log
        print("name ==> \(String(describing: name))")
        print("user ==> \(String(describing: user))")
        print("pass ==> \(String(describing: pass))")
        
        //Check Space
        if (name!.count == 0) || (user!.count == 0) || (pass!.count == 0) {
            //Have Space
            print("Have Space!!!")
        } else{
            print("No Space")
        }
        
    } //Upload Button
    
} //Main Class
