//
//  HomeController.swift
//  vegan-candle-project
//
//  Created by İrem Kurt on 18.01.2021.
//

import UIKit

class HomeController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var stArr:[Candle] = []
    let arr = ["Smoky Bourbon", "Apple Cider", "Mandarin Basil", "Lavander", "Lemon Coco", "Pumpkin Spice", "Sweet Pea", "Coastal Pine", "Fireside", "Evergreen"]
    var selectCandle = ""
    
    
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtDetail: UITextView!
    @IBOutlet weak var shwPrice: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBAction func btnAdd(_ sender: UIButton) {
        
        var cnd = Candle()
        cnd.candle = selectCandle
        cnd.detail = txtDetail.text!
        cnd.price = Int(shwPrice.text!) ?? 0
        cnd.title = txtTitle.text!
        cnd.image = UIImage(named: "\(selectCandle)")!
        
       /*
         if user will not choose any candle in pickerView, we need to show
         alert. but i'm not sure where to put "if statement" with a showAlert
         function..
        */
        
        stArr.append(cnd)
        print(stArr)
        
    }
    
    /* func showAlert() {
        let alert = UIAlertController(title: "Did you forget to choose a candle?", message: "Why are you waiting... Choose already!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in
            print("Tapped Dismiss")
        }))
    } */
    
    @IBAction func btnTable(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
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
        selectCandle = item
        print(item)
    }
    
    // MARK: - Selected candles segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "cell") {
            let vc = segue.destination as! ProductTableView
            vc.arr = stArr
        }
    }
}
