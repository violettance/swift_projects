//
//  ProductTable.swift
//  day-10
//
//  Created by İrem Kurt on 23.01.2021.
//

import UIKit
import Alamofire

class ProductTable: UITableViewController {
    
    var arr: [BilgilerProduct]? = [] // data gelme ihtimali var

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let params = ["ref": "5380f5dbcc3b1021f93ab24c3a1aac24", "start": "0"]
        
        //ref=5380f5dbcc3b1021f93ab24c3a1aac24&userEmail=ali@ali.com&userPass=12345&face=no
        
        let url = "http://jsonbulut.com/json/product.php" // artık burada alomafire başlıyor
        
        AF.request(url, method: .get, parameters: params).responseJSON { (res) in
            
           
            if (res.response?.statusCode == 200) {1
                
            
                let product = try? JSONDecoder().decode(Products.self, from: res.data!)
                
                let status = product?.products[0].durum
                let message = product?.products[0].mesaj
                
                if (status == true) {
                    
                    self.arr = product?.products[0].bilgiler // User login success
                    self.tableView.reloadData()
                   
                   
                }else {
                    print(message!) 
                }
                
                
            }
        }

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr!.count // array kesinlikle dolu gelicek
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let item = arr![indexPath.row] // arr kesinlikle dolu
        
        cell.textLabel?.text = item.productName // ürünlerin başlığı yazılsın

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
