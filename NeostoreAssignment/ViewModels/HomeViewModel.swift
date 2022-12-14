//
//  HomeViewModel.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 30/11/22.
//

import Foundation

protocol HandleHomeAPiProtocol : AnyObject
{
    func handleAPi(_ resp : String)
    func handleError(_ msg : String)
}

class HomeViewModel{
    
    var delegate : HandleHomeAPiProtocol?

    var ProfileData : LoginData?

    
    func returnData(){
        var url = "http://staging.php-dev.in:8844/trainingapp/api/users/getUserData"
        HandleAPi.CallAPiwith(url: url, parameter: ["":""], method: .get, model: HomeModel.self, header : ["access_token" : "637ddf53f2d43"] ) { [self] resp, err in
            print("sadjhasvjh")
            if let status  = resp.status{
                if status == 200{
                    print("got it ")
                    delegate?.handleAPi("Profile data fetched")
                    ProfileData = resp.data?.user_data

                }
                else{
                    
                    delegate?.handleError(resp.message ?? "No msg")
                    print("ERRor is ",resp.message)
                }
            }
           
            
        }
        
    }
}
