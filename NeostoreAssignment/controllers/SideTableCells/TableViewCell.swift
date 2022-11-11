//
//  TableViewCell.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 11/11/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var menuNames: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
