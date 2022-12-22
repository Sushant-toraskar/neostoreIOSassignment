//
//  registerViewModel.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 29/11/22.
//

import Foundation

protocol HandleAPiProtocol : AnyObject
{
    func handleAPi(_ resp : RegisterModel)
    func handleError(_ msg : String)
    
}

class RegisterViewModel{
    
    var delegate:HandleAPiProtocol?
    
    func returnData(parameter : [String:Any] ){
        var url = "http://staging.php-dev.in:8844/trainingapp/api/users/register"
        HandleAPi.CallAPiwith(url: url, parameter: parameter, method: .post,  model: RegisterModel.self, header: [:]) { [self] resp, err in
            if let status  = resp.status,let msg = resp.message{
                if status == 200{
                    delegate?.handleAPi(resp)
                }
                else{
                    delegate?.handleError(msg)
                    print("ERRor is ",msg)
                }
            }
        }
    }
}
