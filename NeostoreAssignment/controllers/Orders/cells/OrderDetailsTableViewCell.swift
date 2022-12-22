//
//  OrderDetailsTableViewCell.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 09/12/22.
//

import UIKit

class OrderDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productPRice: UILabel!
    @IBOutlet weak var productQty: UILabel!
    @IBOutlet weak var ProductName: UILabel!
    @IBOutlet weak var ProductDesc: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
