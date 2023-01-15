//
//  ViewController.swift
//  day-8
//
//  Created by İrem Kurt on 19.01.2021.
//

import UIKit
import AVFoundation
import WebKit

class ViewController: UIViewController {
    
    var soundPlayer: AVAudioPlayer!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func btnPlay(_ sender: UIButton) {
        soundPlayer.play()
    }
    
    @IBAction func btnPause(_ sender: UIButton) {
        soundPlayer.stop()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        // for local mp3
        
        let path = Bundle.main.path(forResource: "muzik", ofType: "mp3")
        let url = URL(fileURLWithPath: path!)
        soundPlayer = try! AVAudioPlayer(contentsOf: url)
         */
        
         
        // for web mp3
        DispatchQueue.main.async {
            let webString = "https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_5MG.mp3"
            let webUrl = URL(string: webString)
                
            self.soundPlayer = try! AVAudioPlayer(data: Data(contentsOf: webUrl!))
        }
       
        //artık contentsof değil data bekledik, local ve web'deki davranışlar farklı olmalı
         
       

        // web url to image with http
        
       // let imgStringUrl = "http://www.myhouseotel.com/uploads/images/set_001fName_20180306105510299.jpg"
        
        // huge web image
        DispatchQueue.main.async {
            let imgStringUrl = "https://images.adsttc.com/media/images/5e1d/02c3/3312/fd58/9c00/06e9/large_jpg/NewHouse_SA_Photo_01.jpg"
            
            let url = URL(string: imgStringUrl)
            let data = try! Data(contentsOf: url!)
            self.imageView.alpha = 0 //yer kaplayacak ama görünmeyecek
            self.imageView.image = UIImage(data: data, scale:0.1)
            UIView.animate(withDuration: 1.0) {
                self.imageView.alpha = 1.0
            }
        }
       
        
        
        // youtube embed video show
        DispatchQueue.main.async {
            let embed = "<!doctype html> <html> <head> <meta charset='utf-8'> <meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'> <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'> </head> <body> <div class='embed-responsive embed-responsive-16by9'> <iframe class='embed-responsive-item' src='https://www.youtube.com/embed/2CHXBMwxRWA?rel=0' allowfullscreen></iframe> </div> </body> </html>"
            self.webView.loadHTMLString(embed, baseURL: nil)
        }
       
    }
    
    /* override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.0) {
            self.imageView.alpha = 1.0
        } // görsel ögeler yüklendiken sonra animation davet edilir, 1 sn içinde gözüksün dedik  */
        
    }
    

