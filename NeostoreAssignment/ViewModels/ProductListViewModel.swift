//
//  ProductListViewModel.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 01/12/22.
//

import Foundation

protocol HandleProdListAPiProtocol : AnyObject
{
    func handleAPi(_ resp : HomeModel)
    func handleError(_ msg : String)
}

class ProductListViewModel{
    
    var delegate : HandleProdListAPiProtocol?
    
    func returnData(_ param : [String : Any] ){
        var url = "http://staging.php-dev.in:8844/trainingapp/api/products/getList?\(param.keys)=\(param.values)"
        HandleAPi.CallAPiwith(url: url, parameter: ["":""], method: .get, model: HomeModel.self, header : [:] ) { [self] resp, err in
            print("sadjhasvjh")
            if let status  = resp.status{
                if status == 200{
                    print("got it ")
                    delegate?.handleAPi(resp)
                }
                else{
                    
                    delegate?.handleError(resp.message ?? "No msg")
                    print("ERRor is ",resp.message!)
                }
            }
           
            
        }
        
    }
}
