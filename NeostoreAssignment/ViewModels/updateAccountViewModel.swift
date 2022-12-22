//
//  HomeViewModel.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 30/11/22.
//

import Foundation

protocol HandleUpdateAccAPiProtocol : AnyObject
{
    func handleAPi(_ msg : String)
    func handleError(_ msg : String)
}

class UpdateAccountViewModel{
    
    var delegate : HandleUpdateAccAPiProtocol?
    var ProfileData : LoginData?
    
    func updateAcc(parameter : [String:String]){
        let url = "http://staging.php-dev.in:8844/trainingapp/api/users/update"
        HandleAPi.CallAPiwith(url: url, parameter: parameter, method: .post, model: LoginModel.self, header : ["access_token" : "637ddf53f2d43"] ) { [self] resp, err in
            print("sadjhasvjh")
            if let status  = resp.status,let msg = resp.message{
                if status == 200{
                    print("got it ")
                    delegate?.handleAPi(msg)
                    ProfileData = resp.data
                }
                else{
                    
                    delegate?.handleError(msg)
                }
            }
           
            
        }
        
    }
}
