//
//  ViewController.swift
//  day-12
//
//  Created by İrem Kurt on 28.01.2021.
//

import UIKit
import NextLevel

class ViewController: UIViewController {
    
    
    @IBOutlet weak var previewView: UIView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let screenBounds = UIScreen.main.bounds
        self.previewView = UIView(frame: screenBounds)
        if let previewView = self.previewView {
            previewView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            previewView.backgroundColor = UIColor.black
            NextLevel.shared.previewLayer.frame = previewView.bounds
            previewView.layer.addSublayer(NextLevel.shared.previewLayer)
            self.view.addSubview(previewView) // artık görsel öge görebiliyor olmamız lazım, artık view içinden görüntümüzü çekebiliriz ama gerçek telefonda
        }
    }
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBAction func fncCamera(_ sender: UIButton) {
    }
    
}

