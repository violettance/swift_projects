//
//  Dashboard.swift
//  day-13
//
//  Created by İrem Kurt on 30.01.2021.
//

import UIKit

class Dashboard: UIViewController {
    
    
    @IBOutlet weak var txtData: UITextField!
    
    @IBAction func btnData(_ sender: UIButton) {
        // dt datasının json dosyası gibi gelmesi gerektiğini unutmayın!!!
        let dt = txtData.text!
        UserDefaults.standard.setValue(dt, forKey: "userData")
        // plist açıcak ve içinde kullanıcı verisini tutucak. value'da kim kayıt yaptıysa userid'sini datalara eşitlicez. (giriş: userID, kayıt sırasında: kullaniciid)
    }
    
    @IBOutlet weak var lblData: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] // klasörde oluşturulsun mu(true) path diye bi dizi oluştu. içine baktık
        print(path)
        
        // UserData Denetimi
        if let data = UserDefaults.standard.string(forKey: "userData") {
        // bak bakalım userdata var mı? varsa şunları yap; object(forKey) de olur
            
        lblData.text = data
            
        // denetimleri yazıp ilgili datayı(userData) yakalayabildik. bunu bütün classlar içinden ulaşabiliriz. sqlite gibi düşünün.
            
        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
