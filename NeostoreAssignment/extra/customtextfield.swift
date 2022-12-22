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
    @IBInspectable var borderclr : UIColor! {
        didSet{
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
}

@IBDesignable class customNavigation : UINavigationController {
    @IBInspectable var titleColor : UIColor! {
        didSet{
            
            self.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
            self.navigationBar.backIndicatorImage = UIImage(systemName: "chevron.backward")
            self.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "chevron.backward")
            
        }
    }
    
    
}

//@IBDesignable class customNavigationbar : UINavigationBar {
//    @IBInspectable var titleColor : UIColor! {
//        didSet{
//
//            self.titleTextAttributes = [.foregroundColor: UIColor.white]
//
//        }
//    }
//}
