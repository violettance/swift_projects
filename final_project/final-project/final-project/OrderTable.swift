//
//  OrderTable.swift
//  final-project
//
//  Created by İrem Kurt on 3.02.2021.
//

import UIKit
import Alamofire
import ProgressHUD

class OrderTable: UITableViewController {
    
    // variable decleration refers to OrderList struct

    var orderList: [OrderListElement]? = [] // probability of receiving data
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ProgressHUD.show(icon: .cart)
        
        if let uid = UserDefaults.standard.string(forKey: "userID") {
            
        let params = ["ref": "5380f5dbcc3b1021f93ab24c3a1aac24", "musterilerID": uid] as [String : Any]
        let url = "http://jsonbulut.com/json/orderList.php"
        
        AF.request(url, method: .get, parameters: params).responseJSON { (response) in
            
            // standard response for successful http request
            
            if ( response.response?.statusCode == 200 ) {
                // print("Data Occured")
                
                // serialization
                
                let userOrder = try? JSONDecoder().decode(OrderList.self, from: response.data!)
               
                self.orderList = userOrder?.orderList[0]
                    self.tableView.reloadData()
                
            }else{
                print("Data Failed")
            }
        }
    }
}
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return orderList?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as! OrderTableCell
            
        let item = orderList![indexPath.row] // orderList definitely on
        
        cell.oTitle.text = item.urunAdi
        cell.oPrice.text = "Price: \(item.fiyat)₺"
        
        // insert image
        
        let url = URL(string: item.normal)!
        let data = try? Data(contentsOf: url)
        cell.oImage.image = UIImage(data: data!)

        
        return cell
    }
}
