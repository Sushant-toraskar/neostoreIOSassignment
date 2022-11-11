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
        self.assignBackground()
        navigationController?.isNavigationBarHidden = true
    }
}

