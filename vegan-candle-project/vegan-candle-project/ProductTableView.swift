//
//  ProductTableView.swift
//  vegan-candle-project
//
//  Created by İrem Kurt on 18.01.2021.
//

import UIKit

class ProductTableView: UITableViewController {
    
    var arr:[Candle] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
        
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        arr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        let item = arr[indexPath.row]
        cell.txtTitle.text = item.title
        cell.shwPrice.text = "\(item.price)$"
        cell.img.image = item.image


        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Click : \(indexPath.row)")
        let item = arr[indexPath.row]
        performSegue(withIdentifier: "detail", sender: item)
    }
    
    // MARK: - Detail segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "detail") {
            let vc = segue.destination as! Detail
            vc.item = sender as! Candle
        }
    }
}
