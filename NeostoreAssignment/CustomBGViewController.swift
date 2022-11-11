//
//  CustomBGViewController.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 09/11/22.
//

import UIKit

extension UIViewController {
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
        
    }
    func assignBackgroundForView(view : UIView){
        let background = UIImage(named: "Background")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .scaleToFill
                imageView.clipsToBounds = true
                imageView.image = background
                imageView.center = view.center
                view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
        
    }
}

