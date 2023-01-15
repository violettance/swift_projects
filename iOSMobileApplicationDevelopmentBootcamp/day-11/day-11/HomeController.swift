//
//  HomeController.swift
//  day-11
//
//  Created by İrem Kurt on 28.01.2021.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtTitle.alpha = 0
        txtDetail.alpha = 0
        UIView.animate(withDuration: 0.4) {
            self.txtTitle.alpha = 1
        } completion: { (bool) in
            UIView.animate(withDuration: 0.4) {
                self.txtDetail.alpha = 1
                
            }
            
        }
       
        UIView.animate(withDuration: 0.6, delay: 0.8, options: [.curveEaseOut, .transitionFlipFromBottom], animations: {
            self.img.frame = CGRect(x: 119, y: 462, width: 177, height: 135)
        }, completion: nil)

    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        print(AppDelegate.notiStatus) // test'e gittik
        
        if (AppDelegate.notiStatus == false){
            let alert = UIAlertController(title: "Warning", message: "Notification Permission Alert", preferredStyle: .alert)
            let gotoSetting = UIAlertAction(title: "Go To Settings", style: .default) { (action) in
                
                if let bundleIdentifier = Bundle.main.bundleIdentifier, let appSettings = URL(string: UIApplication.openSettingsURLString + bundleIdentifier) {
                                    if UIApplication.shared.canOpenURL(appSettings) {
                                        UIApplication.shared.open(appSettings)
                                    }
                                } // bak bakalım falanca url'e gidiyor mu? (kopyaladık burayı)
            }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(gotoSetting)
            alert.addAction(cancel)
            
            //alert'ü göstermek
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtDetail: UITextField!
    
   
    var timeNow: TimeInterval = 0
    @IBAction func fncPicker(_ sender: UIDatePicker) {
        timeNow = sender.date.timeIntervalSinceNow
    }
    @IBAction func btnAdd(_ sender: UIButton) {
        
        if (AppDelegate.notiStatus == true) {
            let title = txtTitle.text!
            let detail = txtDetail.text!
            
            // content
            let content = UNMutableNotificationContent()
            content.title = title
            content.body = detail
            content.badge = 1
            
            // time - trigger
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeNow, repeats: false)
            
            // request
            
            let req = UNNotificationRequest(identifier: "remember_noti", content: content, trigger: trigger) // artık işletim sistemine belirtebilirim
            
            // add
            UNUserNotificationCenter.current().add(req, withCompletionHandler: nil) // uygulama açıkken notification gelmez
        }
    }
    
}

