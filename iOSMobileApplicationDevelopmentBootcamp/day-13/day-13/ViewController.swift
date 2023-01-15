//
//  ViewController.swift
//  day-13
//
//  Created by İrem Kurt on 30.01.2021.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    let animation = Animation.named("splash")
    let animationView = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        animationView.addSubview(animationView)
        
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { (timer) in
            self.performSegue(withIdentifier: "dashboard", sender: nil)
        }
    }


}

