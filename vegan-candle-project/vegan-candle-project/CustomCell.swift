//
//  CustomCell.swift
//  vegan-candle-project
//
//  Created by İrem Kurt on 18.01.2021.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var shwPrice: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
