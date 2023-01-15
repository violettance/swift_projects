//
//  CustomCell.swift
//  day-6
//
//  Created by İrem Kurt on 14.01.2021.
//

import UIKit

class CustomCell: UITableViewCell {
    
    
    @IBOutlet weak var pImage: UIImageView!
    @IBOutlet weak var pTitle: UILabel!
    @IBOutlet weak var pPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
