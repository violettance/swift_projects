//
//  ProductTable.swift
//  final-project
//
//  Created by İrem Kurt on 1.02.2021.
//

import UIKit
import Alamofire

class ProductTable: UITableViewController {
    
    // variable decleration refers to ProductData struct
    
    var arr: [BilgilerProduct] = []
    
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loading.startAnimating()
        self.loading.color = .darkGray
        self.loading.style = .medium
        
        let params = ["ref": "5380f5dbcc3b1021f93ab24c3a1aac24", "start" : "0"]
        let url = "http://jsonbulut.com/json/product.php"
        
        AF.request(url, method: .get, parameters: params).responseJSON { (response) in
            
            // standard response for successful http request
            
            if (response.response?.statusCode == 200) {
                
                // serialization
                
                let product = try! JSONDecoder().decode(ProductData.self, from: response.data!)
                
                let status = product.products[0].durum
                let message = product.products[0].mesaj
                
                if ( status == true ) {
                    
                    self.arr = product.products[0].bilgiler
                    
                    self.tableView.reloadData()
                    
                }else {
                    print(message)
                }
                
                self.loading.stopAnimating()
                self.loading.alpha = 0 // make invisible
                self.loading.frame = CGRect(x: 0, y: 0, width: 0, height: 0)  // remove spacequi
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell

        let item = arr[indexPath.row]
        
        cell.pTitle.text = item.productName
        cell.pPrice.text = "Price: \(item.price) ₺"
        
       // insert image
        
        let url = URL(string: item.images[0].normal)!
        let data = try! Data(contentsOf: url)
        cell.pImage.image = UIImage(data: data)
        
        return cell
    }
    
    // MARK: - Perform segue programmatically
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = arr[indexPath.row]
        performSegue(withIdentifier: "detail", sender: item)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "detail") {
            
        let pt = segue.destination as! ProductDetail
            pt.item = sender as? BilgilerProduct
        }
    }
}
