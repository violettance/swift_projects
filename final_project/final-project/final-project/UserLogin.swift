//
//  UserLogin.swift
//  final-project
//
//  Created by İrem Kurt on 31.01.2021.
//

import UIKit
import Alamofire
import SCLAlertView

class UserLogin: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBAction func btnLogin(_ sender: UIButton) {
        

        let email = txtEmail.text!
        let password = txtPassword.text!
        
        
        let params = ["ref": "5380f5dbcc3b1021f93ab24c3a1aac24", "userEmail": email, "userPass": password, "face": "no"]
        
        // http permission through info.plist
        
        let url = "http://jsonbulut.com/json/userLogin.php"
        
        AF.request(url, method: .get, parameters: params).responseJSON { (response) in
            
            // standard response for successful http request
            
            if (response.response?.statusCode == 200) {
                // print(response.data!)
                
                // serialization
                
                let userLogin = try? JSONDecoder().decode(LoginData.self, from: response.data!)
                
                let status = userLogin?.user[0].durum
                
                // user login success
                
                if (status == true) {
                    
                    // user defaults
                    
                    let userID = userLogin?.user[0].bilgiler?.userID
                    UserDefaults.standard.setValue(userID, forKey: "userID")
                    
                    print(userID as Any)
                    
                    self.performSegue(withIdentifier: "productLogin", sender: nil)
                    
                }else if (email == "" || password == "" ){
                    SCLAlertView().showTitle("Sorry!", subTitle: "All fields are required", style: .success, closeButtonTitle: "OK", timeout: nil, colorStyle: 0xE06666, colorTextButton: 0x251212, animationStyle: .topToBottom)
                }else{
                    SCLAlertView().showTitle("Opps!", subTitle: "User cannot found", style: .success, closeButtonTitle: "OK", timeout: nil, colorStyle: 0xE06666, colorTextButton: 0x251212, animationStyle: .topToBottom)
                }
            }
        }
    }
        override func viewDidLoad() {
            
            super.viewDidLoad()
    }
}
