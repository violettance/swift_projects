//
//  ViewController.swift
//  day-10
//
//  Created by İrem Kurt on 23.01.2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBAction func fncSend(_ sender: UIButton) {
        
        let email = txtEmail.text!
        let pass = txtPass.text!
        
        
        let params = ["ref": "5380f5dbcc3b1021f93ab24c3a1aac24", "userEmail": email, "userPass":pass, "face":"no"]
        
       //ref=5380f5dbcc3b1021f93ab24c3a1aac24&userEmail=ali@ali.com&userPass=12345&face=no
        
        let url = "https://jsonbulut.com/json/userLogin.php" // artık burada alomafire başlıyor
        
        AF.request(url, method: .get, parameters: params).responseJSON { (res) in
           
            // Standard response for seccusfuk HTTP request kontrol
            if (res.response?.statusCode == 200) {
                
               // print(res.data!) // yazdırmanız tavsiye edilir. artık gönder butonuna basarken sonuç döner. programı çalışltıralım.
                let userLogin = try? JSONDecoder().decode(UserLogin.self, from: res.data!)
                // gelen res.datayı userLogin türüne dönüştürdük (serialize)
                
                let status = userLogin?.user[0].durum
                let message = userLogin?.user[0].mesaj // obje halinde kullandığımız dataları istediğimz şekilde görürüz
                
                if (status == true) {
                    // User login success
                    self.performSegue(withIdentifier: "product", sender: nil) // product'a göndericez giriş başarılıysa
                    print(message!)
                }else {
                    print(message!) // datalar geldiyse userlogin çalışıcak. res'in altındaki data byte halinde gelirken artık nesnel davranış niteliği taşıyacak niteliğe getirdik
                }
                
                
            }
        } // programda status code 200 dönmesi: ilk tetikleme unsuru ortaya çıktı, parametreleri program içine gönderdik. servis ziyareti sağlandıktan sonra dönen sonuçlar res içinde saklanıcak. servis ziyaret edilir, servisten dönen datayı yakalar demek.
        
    }
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

/*
 temel amaç cloud sistemine bağlanıp getirilmesini sağlamak:
önce struct oluşturduk, bilgiler soru işereti şeklinde gelme ihtimali olan datalarda
servise çıkacağımız zaman : alomafire librarysi http olaylarında güçlü
200 yanıtı önemli, artık dataları yorumlama biiçimleri
dönen data biriminin objeye dönüşüm önemli. dönen dataya convertini oluşturduk.
0. elemanına bakıp durum bilgisine ualştık. hem durumu hem mesajı yakalamış olduk
 */

