//
//  ViewController.swift
//  shopping-list-project
//
//  Created by İrem Kurt on 24.01.2021.
//

import UIKit
import SCLAlertView

class ViewController: UIViewController {
    
    let db = Database()
    
    @IBOutlet weak var txtFood: UITextField!
    @IBOutlet weak var txtDetail: UITextField!
    @IBAction func btnAdd(_ sender: UIButton) {
        
        
        
        let foodv = txtFood.text!
        let detailv = txtDetail.text!
        
        if ( foodv == "") {
            SCLAlertView().showInfo("Something missing", subTitle: "Feel free to add wishes :)",closeButtonTitle: "OK", timeout: nil, colorStyle: 0xE06666, colorTextButton: 0x251212, animationStyle: .topToBottom)
            
        }else {
            
            SCLAlertView().showTitle("Congrats!", subTitle: "\(txtFood.text!) successfully added to list...", style: .success, closeButtonTitle: "Continue", timeout: nil, colorStyle: 0xE06666, colorTextButton: 0x251212, animationStyle: .topToBottom)
            
            let rowid = db.itemInsert(food: foodv, detail: detailv)
            print(rowid)
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        db.fncConnection()
    }


}

