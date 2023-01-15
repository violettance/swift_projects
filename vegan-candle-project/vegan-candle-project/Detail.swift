//
//  Detail.swift
//  vegan-candle-project
//
//  Created by İrem Kurt on 18.01.2021.
//

import UIKit

class Detail: UIViewController {
    
    var item = Candle()

    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var shwPrice: UILabel!
    @IBOutlet weak var txtDetail: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        img.image = item.image
        txtTitle.text = item.title
        shwPrice.text = "\(item.price)₺"
        txtDetail.text = item.detail

    }
    
}
