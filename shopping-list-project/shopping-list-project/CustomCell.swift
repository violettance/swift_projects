//
//  CustomCell.swift
//  shopping-list-project
//
//  Created by İrem Kurt on 25.01.2021.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var txtFood: UILabel!
    @IBOutlet weak var txtDetail: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
