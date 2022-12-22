//
//  cartFooterTableViewCell.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 05/12/22.
//

import UIKit



class cartFooterTableViewCell: UITableViewCell {

    @IBOutlet weak var OrderNowBtn: custombtn!
    @IBOutlet weak var TotalCost: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    
}
