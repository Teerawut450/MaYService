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
    
    
    func uploadToServer(name: String, user: String, pass: String) -> Void {
        let myConstant = MyConstant()
        let urlPHP: String = myConstant.findURLaddUser(name: name, user: user, pass: pass)
        print("This is url ==> \(urlPHP)")
        
        
        // Upload Process
        let url = URL(string: urlPHP)
        let request = NSMutableURLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request as URLRequest) { data,response,error in
            if error != nil {
                print("Have Error")
            } else {
                //Receive Data
                if let testData = data {
                    let canReadData = NSString(data: testData, encoding: String.Encoding.utf8.rawValue)
                    print("canReadData is ==> \(String(describing: canReadData))")
                    
                    let myResponse: String = canReadData! as String
                    if Bool(myResponse)! {
                        print("Success")
                        
                        DispatchQueue.main.async {
                            self.performSegue(withIdentifier: "BackMainScreen", sender: self)
                        }
                        
                    } else {
                       print("Fail")
                    }
                }
            }
        } // End Task
        task.resume()
    }
    
    
    func showAlert(title: String,message: String) -> Void {
        
        let objAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        objAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            objAlert.dismiss(animated: true, completion: nil)
        }))
        
        
        objAlert.addAction(UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.default, handler: { (action) in
            objAlert.dismiss(animated: true, completion: nil)
        }))
        
//        สั่งให้ ViewController ด้านหลังหยุด
        self.present(objAlert, animated: true, completion: nil)
        
        
    }
    
    
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
            //print("Have Space!!!")
            showAlert(title: "Error", message: "Have space. Please fill all text")
            
        } else{
            print("No Space")
            uploadToServer(name: name!, user: user!, pass: pass!)
        }
        
    } //Upload Button
    
} //Main Class
