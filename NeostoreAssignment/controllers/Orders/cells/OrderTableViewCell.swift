//
//  OrderTableViewCell.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 08/12/22.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    @IBOutlet weak var orderId: UILabel!
    @IBOutlet weak var orderDate: UILabel!
    @IBOutlet weak var OrderPrice: UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
