//
//  ProductTableView.swift
//  day-6
//
//  Created by İrem Kurt on 14.01.2021.
//

import UIKit

class ProductTableView: UITableViewController {
    
    var arr:[Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataResult()
    }
    
    func dataResult() {
        
        for i in 0...8 {
            var pro = Product()
            pro.title = "Title- \(i)"
            pro.detail = "Detail- \(i)"
            pro.price = i
            pro.image = UIImage(named: "\(i)")!
            arr.append(pro)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell

        let item = arr[indexPath.row]
        cell.pTitle.text = item.title
        cell.pPrice.text = "\(item.price)"
        cell.pImage.image = item.image
        
        

        return cell
    }

    //üstteki işlem sağlandığında direkt bu çalışır.
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Click : \(indexPath.row)")
        let item = arr[indexPath.row]
        performSegue(withIdentifier: "detail", sender: item)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if ( segue.identifier == "detail" ) {
            let vc = segue.destination as! Detail
            vc.item = sender as! Product
            
        }
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
