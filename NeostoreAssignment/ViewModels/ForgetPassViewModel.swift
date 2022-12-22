//
//  registerViewModel.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 29/11/22.
//

import Foundation

protocol handleFPprotocol : AnyObject
{
    func handleFPAPi(_ resp : ForgetPassModel)
    func handleError(_ msg : String)
}

class forgetPassViewModel{
    
    var delegate:handleFPprotocol?
    
    func returnData(parameter : [String:Any] ){
        var url = "http://staging.php-dev.in:8844/trainingapp/api/users/forgot"
        HandleAPi.CallAPiwith(url: url, parameter: parameter, method: .post, model: ForgetPassModel.self, header: [:]) { [self] resp, err in
            if let status  = resp.status,let msg = resp.message{
                if status == 200{
                    delegate?.handleFPAPi(resp)
                }
                else{
                    delegate?.handleError(msg)
                    print("ERRor is ",msg)
                }
            }
           
            
        }
        
    }
}
