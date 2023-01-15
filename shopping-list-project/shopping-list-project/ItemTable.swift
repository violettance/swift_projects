//
//  ItemTable.swift
//  shopping-list-project
//
//  Created by İrem Kurt on 24.01.2021.
//

import UIKit
import SCLAlertView

class ItemTable: UITableViewController {

    let db = Database()
    var arr:[ItemSt] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        db.fncConnection()
        arr = db.itemList() // data available after this step
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

        let y = arr[indexPath.row]
        
        cell.txtFood?.text = y.food // food data sent
        cell.txtDetail?.text = y.detail // detail data sent

        return cell
    }
    

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true // editable
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let z = arr[indexPath.row]
            let del = db.itemDelete(iid: z.id)
            if (del > 0) {
                arr.remove(at: indexPath.row) // delete row from data source
                tableView.deleteRows(at: [indexPath], with: .middle)
            }
        }
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = arr[indexPath.row]
        print(item.detail as Any)
        
        SCLAlertView().showTitle("", subTitle: item.detail ?? "", style: .success, closeButtonTitle: "Perfect!", timeout: nil, colorStyle: 0x908585, colorTextButton: 0xE7E5E5, animationStyle: .topToBottom)

    }
}
