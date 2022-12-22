//
//  ProductListTableViewCell.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 15/11/22.
//

import UIKit

class ProductListTableViewCell: UITableViewCell {

    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var ProductName: UILabel!
    @IBOutlet weak var productDisc: UILabel!
    @IBOutlet weak var productAmount: UILabel!
    
    
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

        // Configure the view for the selected state
    }
    
    func showStars(noOFStars num : Int){
        switch num {
        case 0 :
            star1.image = UIImage(named: "star_unchek")
            star2.image = UIImage(named: "star_unchek")
            star3.image = UIImage(named: "star_unchek")
            star4.image = UIImage(named: "star_unchek")
            star5.image = UIImage(named: "star_unchek")
        
        case 1 :
            star1.image = UIImage(named: "star_check")
            star2.image = UIImage(named: "star_unchek")
            star3.image = UIImage(named: "star_unchek")
            star4.image = UIImage(named: "star_unchek")
            star5.image = UIImage(named: "star_unchek")
            
        case 2 :
            star1.image = UIImage(named: "star_check")
            star2.image = UIImage(named: "star_check")
            star3.image = UIImage(named: "star_unchek")
            star4.image = UIImage(named: "star_unchek")
            star5.image = UIImage(named: "star_unchek")
            
        case 3 :
            star1.image = UIImage(named: "star_check")
            star2.image = UIImage(named: "star_check")
            star3.image = UIImage(named: "star_check")
            star4.image = UIImage(named: "star_unchek")
            star5.image = UIImage(named: "star_unchek")
            
        case 4 :
            star1.image = UIImage(named: "star_check")
            star2.image = UIImage(named: "star_check")
            star3.image = UIImage(named: "star_check")
            star4.image = UIImage(named: "star_check")
            star5.image = UIImage(named: "star_unchek")
            
        case 5 :
            star1.image = UIImage(named: "star_check")
            star2.image = UIImage(named: "star_check")
            star3.image = UIImage(named: "star_check")
            star4.image = UIImage(named: "star_check")
            star5.image = UIImage(named: "star_check")
        default:
            print("case not found")
        }
        
    }
    
}
