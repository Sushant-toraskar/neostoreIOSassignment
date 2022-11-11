//
//  ProfilePicCellTableViewCell.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 11/11/22.
//

import UIKit

class ProfilePicCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profilePic: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        profilePic.layer.cornerRadius = profilePic.frame.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
