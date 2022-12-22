//
//  SideMenuTableViewCell.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 11/11/22.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {


    @IBOutlet weak var routeIcon: UIImageView!
    @IBOutlet weak var cartItems: custombtn!
    @IBOutlet weak var RouteName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
