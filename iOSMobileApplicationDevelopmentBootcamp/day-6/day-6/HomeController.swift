//
//  HomeController.swift
//  day-6
//
//  Created by İrem Kurt on 15.01.2021.
//

import UIKit

class HomeController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var stArr:[Cities] = []
    let arr = ["Adana", "Bursa", "Van", "Gaziantep", "Hatay"]
    var selectCity = ""
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var txtTitle: UITextField!
    @IBAction func btnAdd(_ sender: UIButton) {
        
        let title = txtTitle.text!
        var cit = Cities()
        cit.city = selectCity
        cit.title = title
        
        stArr.append(cit)
        
        print(stArr)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self

        // Do any additional setup after loading the view.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        arr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arr[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let item = arr[row]
        selectCity = item
        print(item)
    }
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

