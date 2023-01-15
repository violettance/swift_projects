//
//  OrderTableCell.swift
//  final-project
//
//  Created by İrem Kurt on 4.02.2021.
//

import UIKit

class OrderTableCell: UITableViewCell {
    
    @IBOutlet weak var oImage: UIImageView!
    @IBOutlet weak var oTitle: UILabel!
    @IBOutlet weak var oPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
