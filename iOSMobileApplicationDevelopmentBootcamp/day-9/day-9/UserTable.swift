//
//  UserTable.swift
//  day-9
//
//  Created by İrem Kurt on 21.01.2021.
//

import UIKit

class UserTable: UITableViewController {
    let db = DB()
    var arr:[UserSt] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        db.fncConnection()
        arr = db.userList() // artık datamız var denir
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr.count // kaç tane eleman oluşturması gerekli
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let item = arr[indexPath.row]

        cell.textLabel?.text = item.name // data burdan iletilmiş olur
        
        

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
        
        // sola doğru çektiğimizde editlenmeye uygun hale gelmiş olur!!! (canEditRowAt)
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete { //sola doğru delete geldi burdan
            // Delete the row from the data source
            let item = arr[indexPath.row]// silinmeye çalışan id var alttakileri yap demek:
            let deleteRow = db.userDelete(uid: item.id)
            if (deleteRow > 0) {
                arr.remove(at: indexPath.row) // source'tan da kaldırmış oluruz bu yolla
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            // tableView.deleteRows(at: [indexPath], with: .fade) // niye comment haline getirdik şimdilik? sonra kullanıcaz
        } // insert'ü sildik burdan
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = arr[indexPath.row]
        print(item.email)
    }

}
