//
//  PhotosTable.swift
//  day-12
//
//  Created by İrem Kurt on 28.01.2021.
//

import UIKit
import Alamofire

class PhotosTable: UITableViewController {
    
    var photos: PhotosData? = []

    @IBOutlet weak var load: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        load.startAnimating()
       let url = "https://jsonplaceholder.typicode.com/photos"
        
        AF.request(url).responseJSON { (res) in // servisin ziyareti yapıldı bile, dönen datalar res'in altında
            
            if (res.response?.statusCode == 200){
                self.photos = try? JSONDecoder().decode(PhotosData.self, from: res.data!)
                self.tableView.reloadData()
                // zorunluluk. ilk seferinde table boş, data sonradan geliyor. sonra reload yöntemine tabi tutulması gerekmektedir ki refresh olsun. datalar gelene kadar boş table görürürüz... reload önemli!!!
                self.load.stopAnimating()
                self.load.alpha = 0 // görünmez yap
                self.load.frame = CGRect(x: 0, y: 0, width: 0, height: 0) // işlem bittiğinde view'deki üstte olan boşluk gitti
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
        return photos!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let item = photos![indexPath.row]
        cell.textLabel?.text = item.title // serpiştirme
        cell.detailTextLabel?.text = String(item.id)  // subtitle'a id getirdik
        
        // image ekleme - urle çeviricez
        let url = URL(string: item.thumbnailURL)
        let data = try! Data(contentsOf: url!)
        cell.imageView?.image = UIImage(data: data)

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
