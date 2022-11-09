//
//  ViewController.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 08/11/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var UsrnameInput: UITextField!
    @IBOutlet weak var LoginBtn: UIButton!
    @IBOutlet weak var PasswordInput: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       assignBackground()
        otherCompStyling()
    }
    
    
    func otherCompStyling(){
//        UsrnameInput.tintColor = .white
//        UsrnameInput.backgroundColor = .white
//        UsrnameInput.textColor = .white
//        UsrnameInput.layer.borderColor = UIColor.white.cgColor
//        UsrnameInput.layer.borderWidth = 2.0
//        let imageview = UIView(frame: CGRect(x: 5, y: 0, width: 50, height: 35))
////        imageview.layer.backgroundColor = UIColor.red.cgColor
//        let userimage = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
//        userimage.center = imageview.center
////        userimage.layer.masksToBounds = true
//        imageview.addSubview(userimage)
//        userimage.image = UIImage(named: "username_icon")
//        userimage.contentMode = .scaleAspectFill
//        UsrnameInput.leftViewMode = .always
//        UsrnameInput.leftView = imageview
        
        
        
        
//        let passimage = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
//        passimage.center = imageview.center
//        imageview.addSubview(passimage)
//        userimage.image = UIImage(named: "password_icon")
//        userimage.contentMode = .scaleAspectFill
//        PasswordInput.leftViewMode = .always
//        PasswordInput.leftView = imageview
//        PasswordInput.textColor = .white
//        PasswordInput.layer.borderColor = UIColor.white.cgColor
//        PasswordInput.layer.borderWidth = 2.0
        
        addLeftImages(on: UsrnameInput, img: "username_icon")
        addLeftImages(on: PasswordInput, img: "password_icon")
//        UsrnameInput.layer.masksToBounds = true
    }
    
    func addLeftImages(on inputview : UITextField , img image : String){
        inputview.textColor = .white
        inputview.layer.borderColor = UIColor.white.cgColor
        inputview.layer.borderWidth = 2.0
        let imageview = UIView(frame: CGRect(x: 5, y: 0, width: 50, height: 35))
//        imageview.layer.backgroundColor = UIColor.red.cgColor
        let userimage = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        userimage.center = imageview.center
//        userimage.layer.masksToBounds = true
        imageview.addSubview(userimage)
        userimage.image = UIImage(named: image)
        userimage.contentMode = .scaleAspectFill
        inputview.leftViewMode = .always
        inputview.leftView = imageview
    }
    
    
    
    func assignBackground(){
        let background = UIImage(named: "Background")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .scaleToFill
                imageView.clipsToBounds = true
                imageView.image = background
                imageView.center = view.center
                view.addSubview(imageView)
                self.view.sendSubviewToBack(imageView)
        navigationController?.isNavigationBarHidden = true
    }


}

