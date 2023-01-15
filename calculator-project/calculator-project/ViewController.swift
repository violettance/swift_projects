//
//  ViewController.swift
//  calculator-project
//
//  Created by İrem Kurt on 7.01.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstData: UITextField!
    @IBOutlet weak var secondData: UITextField!
    @IBOutlet weak var resultData: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sumButton(_ sender: UIButton) {
        
        let firstValue = Double(firstData.text!)
        let secondValue = Double(secondData.text!)
        
            if firstValue != nil && secondValue != nil {
        
        let outputValue = Double(firstValue! + secondValue!)
            resultData.text = ("Result: \(outputValue)")
            
        }   else {
            resultData.text = ("Hey pal! Enter a number")
            
            //print("tapped sum button")
        }
    }

    @IBAction func minusButton(_ sender: UIButton) {
        let firstValue = Double(firstData.text!)
        let secondValue = Double(secondData.text!)
        
        if firstValue != nil && secondValue != nil {
            
        let outputValue = Double(firstValue! - secondValue!)
        resultData.text = ("Result: \(outputValue)")
            
        }   else {
            resultData.text = ("Hey pal! Enter a number")
        }
    }
    
    @IBAction func timesignButton(_ sender: UIButton) {
        let firstValue = Double(firstData.text!)
        let secondValue = Double(secondData.text!)
        
            if firstValue != nil && secondValue != nil {
        
        let outputValue = Double(firstValue! * secondValue!)
        resultData.text = ("Result: \(outputValue)")
            
        }   else {
            resultData.text = ("Hey pal! Enter a number")
        }
    }
    
    @IBAction func divisionButton(_ sender: UIButton) {
        let firstValue = Double(firstData.text!)
        let secondValue = Double(secondData.text!)
        
            if firstValue != nil && secondValue != nil {
        
        let outputValue = Double(firstValue! / secondValue!)
        resultData.text = ("Result: \(outputValue)")
                
        }   else {
            resultData.text = ("Hey pal! Enter a number")
        }
    }
}
