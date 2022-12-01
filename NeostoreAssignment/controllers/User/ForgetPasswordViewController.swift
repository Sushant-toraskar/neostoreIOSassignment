//
//  ForgetPasswordViewController.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 09/11/22.
//

import UIKit

class ForgetPasswordViewController: UIViewController {
    var vm = forgetPassViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.assignBackground()
        vm.delegate = self
        
    }
    
    
    @IBAction func HandleButtonClick(_ sender: Any) {
        var parameter = ["email":"cehela8579@xegge.com"]
        vm.returnData(parameter: parameter)
    }
}

extension ForgetPasswordViewController : handleFPprotocol{
    func handleFPAPi(_ resp: ForgetPassModel) {
        successAlert(resp.user_msg!, self: self)
    }
    
    func handleError(_ msg: String) {
        showError(msg, self: self)
    }
    
    
}
