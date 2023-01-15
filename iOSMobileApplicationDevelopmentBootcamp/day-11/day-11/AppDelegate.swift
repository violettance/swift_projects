//
//  AppDelegate.swift
//  day-11
//
//  Created by İrem Kurt on 26.01.2021.
//

import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    let notification = UNUserNotificationCenter.current()
    static var notiStatus = false

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        notification.delegate = self // uygulama diyelim ki kapalı, uygulama mesaj gönderdiğinde açılır ama açıldığında ne olacağını söylememiz lazımdır. Notificationları dinlemek için gereken ortam hazırlandı daha. Hala izin alınmadı.
        notification.requestAuthorization(options: [.alert, .badge, .sound]) { (status, error) in
            
            if (status == true){
                print("status", status)
                AppDelegate.notiStatus = true
                
            }else {
                print("Notification Permission False")
                // print("status", (error?.localizedDescription)!) // hangi dilde geleceğini burdan belirliyoruz
            }
            
            //print("status", (error?.localizedDescription)!) -> buraya kadar izin penceresi oluşturduk
            
        } // işlem tamalandığında herhangi bir hata var mı bunu gözlemlememize yarıyor handler. option içinde izinleri aldık.
        //Handler: Kullanıcı izin verdi mi (bool), bildirimler işletim sisteminde kapalysa ama kullanıcı izin verdiyse (error)
        
        
        return true // icon'a tıklandığı andan itibaren çalışan method
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("applicationDidBecomeActive Call")
    }
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

