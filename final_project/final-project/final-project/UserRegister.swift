//
//  UserRegister.swift
//  final-project
//
//  Created by İrem Kurt on 31.01.2021.
//

import UIKit
import Alamofire
import SCLAlertView

class UserRegister: UIViewController {
    
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtSurname: UITextField!
    @IBOutlet weak var lblNumber: UITextField!
    @IBOutlet weak var txtMail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
   
    @IBAction func userRegister(_ sender: UIButton) {
    
        let name = txtName.text!
        let surname = txtSurname.text!
        let number = Int(lblNumber.text!) ?? 0
        let email = txtMail.text!
        let password = txtPassword.text!
        
        
        let params = ["ref": "5380f5dbcc3b1021f93ab24c3a1aac24", "userName": name, "userSurname": surname, "userPhone": number, "userMail": email, "userPass": password, "face": "no"] as [String : Any]
        
        let url = "http://jsonbulut.com/json/userRegister.php"
    
        
        AF.request(url, method: .get, parameters: params).responseJSON { (response) in
            
            // standard response for successful http request
            
            if (response.response?.statusCode == 200) {
                
                // serialization
                
                let userRegister = try? JSONDecoder().decode(RegisterData.self, from: response.data!)
                    
                let status = userRegister?.user[0].durum
                // let message = userRegister?.user[0].mesaj
                    
                // user register success
                
                    if (status == true) {
                        // print(message ?? 0)
                        
                        // user defaults
                        
                        let userID = userRegister?.user[0].kullaniciID
                        UserDefaults.standard.setValue(userID, forKey: "userID")
                        print(userID as Any)
                        
                            self.performSegue(withIdentifier: "productRegister", sender: nil)
                        
                // check if is null
                        
                }else if (name == "" || surname == "" || number == 0 ||  email == "" || password == "" ){
                    
                        SCLAlertView().showTitle("Sorry!", subTitle: "All fields are required", style: .success, closeButtonTitle: "OK", timeout: nil, colorStyle: 0xE06666, colorTextButton: 0x251212, animationStyle: .topToBottom)
                        
                    }else{
                        
                        SCLAlertView().showTitle("User already exist!", subTitle: "Try to login", style: .success, closeButtonTitle: "OK", timeout: nil, colorStyle: 0xE06666, colorTextButton: 0x251212, animationStyle: .topToBottom)
                }
            }
        }
    }
    
        override func viewDidLoad() {
        super.viewDidLoad()
   }
}
