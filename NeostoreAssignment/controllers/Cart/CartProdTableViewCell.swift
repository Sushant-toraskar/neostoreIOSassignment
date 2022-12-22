//
//  CartProdTableViewCell.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 02/12/22.
//

import UIKit
import DropDown

class CartProdTableViewCell: UITableViewCell {
    @IBOutlet weak var cartProdImg: UIImageView!
    @IBOutlet weak var cartProdName: UILabel!
    @IBOutlet weak var cartProdDesc: UILabel!
    @IBOutlet weak var cartProdPrice: UILabel!
    @IBOutlet weak var dropdownViwq: UIView!
    
    @IBOutlet weak var dropDownButton: UIButton!
    
    @IBOutlet weak var cartProdCount: UILabel!
    let dropDown = DropDown()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dropDownButton.addTarget(self, action: #selector(dropDownButtonTapped), for: .touchUpInside)
        dropDown.anchorView = dropdownViwq
        dropDown.dataSource = ["1","2","3","4","5"]
//        dropDown.selectionAction = {
//            (index : Int,item : String) in
//            if self.cartProdCount.text != item{
//                self.cartProdCount.text = item
//
//            }
//        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
    @IBAction func openDropDown(_ sender: UIButton!) {
        dropDown.show()
    }
    
    @objc func dropDownButtonTapped(_ sender: Any){
        print("Tapped")
    }
    
}
