//
//  CustomCell.swift
//  final-project
//
//  Created by İrem Kurt on 1.02.2021.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var pImage: UIImageView!
    @IBOutlet weak var pTitle: UILabel!
    @IBOutlet weak var pPrice: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
