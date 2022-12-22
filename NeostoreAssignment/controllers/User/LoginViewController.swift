//
//  ViewController.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 08/11/22.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var UsrnameInput: UITextField!
    @IBOutlet weak var LoginBtn: UIButton!
    @IBOutlet weak var PasswordInput: UITextField!
    
    private var viewModel =  LoginViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.assignBackground()
        navigationController?.isNavigationBarHidden = true
    }
    
    func navigateToHome() {
        print("navigation in progress")
    }
    
    
    @IBAction func LoginAPiCall(_ sender: Any) {
        self.startLoader()
        viewModel.CallRegisterAPiAF { resp, err in
            print(resp,err)
            self.stopLoader()
//            self.StartLoader(false)
            let nextVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "sideMenuViewController") as! sideMenuViewController
            nextVc.profileVM = self.viewModel
            self.navigationController?.pushViewController(nextVc, animated: true)
        }
    }
}


