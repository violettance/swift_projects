//
//  ProductDetail.swift
//  final-project
//
//  Created by İrem Kurt on 3.02.2021.
//

import UIKit
import Alamofire
import SCLAlertView

class ProductDetail: UIViewController {

    // variable decleration refers to ProductData struct
    
    var item: BilgilerProduct?
    
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productBrief: UITextView!
    @IBAction func btnOrder(_ sender: UIButton) {
        
      
        if let uid = UserDefaults.standard.string(forKey: "userID") , let pid = item?.productID {
            
        let params = ["ref": "5380f5dbcc3b1021f93ab24c3a1aac24", "customerId": uid, "productId": pid, "html": pid]
        let url = "http://jsonbulut.com/json/orderForm.php"
            
            AF.request(url, method: .get, parameters: params).responseJSON { (response) in
                
                // standard response for successful http request
                
                if(response.response?.statusCode == 200) {
                    
                    // serialization
                    
                    let orderSent = try? JSONDecoder().decode(OrderForm.self, from: response.data!)
                    
                    let status = orderSent?.order[0].durum
                    
                    if (status == true) {
                        
                     print("Data OK")
                        
                    SCLAlertView().showTitle("Congrats!", subTitle: "Order successfully made", style: .success, closeButtonTitle: "OK", timeout: nil, colorStyle: 0xE06666, colorTextButton: 0x251212, animationStyle: .topToBottom)
                        self.performSegue(withIdentifier: "sendOrder", sender: self.item)
                        
                    }else{
                        print("Data failed")
                        
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        productName.text = item?.productName
        productPrice.text = "Price: \(item!.price)₺"
        productBrief.text = item?.bilgilerDescription
        
        // insert image
        
        let url = URL(string: item!.images[0].normal)!
        let data = try! Data(contentsOf: url)
        productImage.image = UIImage(data: data)
    
    }
}
