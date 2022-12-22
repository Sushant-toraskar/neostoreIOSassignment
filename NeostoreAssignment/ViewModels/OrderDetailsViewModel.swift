//
//  HomeViewModel.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 30/11/22.
//

import Foundation

protocol HandleOrderDetailsAPiProtocol : AnyObject
{
    func handleAPi(_ msg : String)
    func handleError(_ msg : String)
}

class OrderDetailsViewModel{
    
    var delegate : HandleOrderDetailsAPiProtocol?
    var ProfileData : OrderDetailsData?
    
    func updateAcc(param : [String:Any]){
        let key = param.first?.key ?? ""
        var value = 0
        value = param.first?.value as! Int
        let url = "http://staging.php-dev.in:8844/trainingapp/api/orderDetail?\(key)=\(value)"
        HandleAPi.CallAPiwith(url: url, parameter: [:], method: .get, model: OrderDetailsModel.self, header : ["access_token" : "637ddf53f2d43"] ) { [self] resp, err in
            print(resp,"data")
            if let status  = resp.status{
                if status == 200{
                    ProfileData = resp.data
                    print("got it details")
                    delegate?.handleAPi("Product details are fetched")
                    
                }
                else{
                    delegate?.handleError(resp.message ?? "Error")
                }
            }
        }
    }
}
