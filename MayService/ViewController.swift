//
//  ViewController.swift
//  MayService
//
//  Created by TST-APP-01 on 24/1/2562 BE.
//  Copyright © 2562 Teerawut. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var user: String?
    var pass: String?
    

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    } //Main Method
    
    @IBAction func loginButton(_ sender: UIButton) {
        user = userTextField.text
        pass = passTextField.text
        if (checkSpace(user: user!, pass: pass!)){
            showAlert(title: "OK", message: "OK")
            checkAuthen(user: user!, pass: pass!)
        } else {
            showAlert(title: "FAIL", message: "FAIL")
        }
    }
    
    
    func checkAuthen(user: String, pass: String) -> Void {
        let myConstant = MyConstant()
        let urlPHP = myConstant.findJSONwhereUser(user: user)
        print("URL ==> \(urlPHP)")
        
        guard let url = URL(string: urlPHP) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            guard let dataResponse = data, error == nil else {
                print("Have Error")
                return
            }
            
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
                print("JSON ==> \(jsonResponse)")
            } catch let myError {
                print(myError)
                print("NO \(user) in my Database")
                DispatchQueue.main.async {
                    self.showAlert(title: "User Incorrect", message: "NO \(user) in my Database")
                }
            }
            
            
        } // End Task
        task.resume()
        
        
    }
    
    
    
    func checkSpace(user: String,pass: String) -> Bool {
        if  (user.count == 0) || (pass.count == 0) {
            //Have Space
            //print("Have Space!!!")
            return false
        } else{
            return true
        }
    }
    
    
    func showAlert(title: String,message: String) -> Void {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        
        // bjAlert.addAction(UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.default, handler: { (action) in
        // objAlert.dismiss(animated: true, completion: nil)
        //}))

        //        สั่งให้ ViewController ด้านหลังหยุด
        self.present(alert, animated: true, completion: nil)
    }
}

