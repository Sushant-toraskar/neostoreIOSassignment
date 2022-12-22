//
//  addressTableViewCell.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 08/12/22.
//

import UIKit

class addressTableViewCell: UITableViewCell {

    @IBOutlet weak var AddressLabel: UILabel!
    @IBOutlet weak var radioBtn: custombtn!
    @IBOutlet weak var AddressView: UIView!
    @IBOutlet weak var deleteAddress: UIButton!
    var deleteToggle = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.AddressView.layer.borderWidth = 1.0
        self.AddressView.layer.borderColor = UIColor.systemGray5.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func handleDeleteAdd(_ sender: Any) {
        deleteToggle = true
    }
    
    @IBAction func handleRadioBtn(_ sender: Any) {
    }
}
