//
//  Detail.swift
//  day-6
//
//  Created by İrem Kurt on 14.01.2021.
//

import UIKit

class Detail: UIViewController {
    
    var item = Product()
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var pTitle: UILabel!
    @IBOutlet weak var pPrice: UILabel!
    @IBOutlet weak var pDetail: UITextView!
    
//custom class ekledikten sonra kntrl ile kulağından tutup buraya ekleyeceğiz. Image, labelx2 ve text field için ayrı ayrı {img,pTitle, pPrice,pDetail olmak üzere}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        img.image = item.image
        pTitle.text = item.title
        pPrice.text = "\(item.price)₺"
        pDetail.text = item.detail
        
    }
    
}
        
        /*
 
        img.image = item.image
        //resmin içindeki resim resimin içinde gözüksün!
 
        pTitle.text = item.title
        pPrice.text = "\(item.price)₺"
        pDetail.text = item.detail
 
        /*

 
 
 
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
 */*/*/
