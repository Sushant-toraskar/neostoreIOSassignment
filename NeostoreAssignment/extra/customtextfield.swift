//
//  customtextfield.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 09/11/22.
//
import Foundation
import UIKit

@IBDesignable class customtextfield: UITextField {
  
    
    @IBInspectable var leftimage : UIImage!{
        didSet{
            let imageview = UIView(frame: CGRect(x: 2, y: 0, width: 50, height: 35))
            let userimage = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
            userimage.image = leftimage
            imageview.addSubview(userimage)
            userimage.center = imageview.center
            userimage.contentMode = .scaleAspectFit
            self.leftView = imageview
            self.leftViewMode = .always
            self.layer.borderColor = UIColor.white.cgColor
            self.layer.borderWidth = 1.0
        }
    }
}

@IBDesignable class custombtn : UIButton{
    @IBInspectable var roundedCorner : CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = roundedCorner
        }
    }
}
