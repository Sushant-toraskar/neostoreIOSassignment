//
//  ProductListViewModel.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 01/12/22.
//

import Foundation

protocol HandleProdListAPiProtocol : AnyObject
{
    func handleAPi()
    func handleError(_ msg : String)
}

class ProductListViewModel{
    
    var delegate : HandleProdListAPiProtocol?
    var model: [ProductList]?
    
    func returnData(_ param : [String : Any] ){
        let url = "http://staging.php-dev.in:8844/trainingapp/api/products/getList?\(Array(param.keys)[0])=\(Array(param.values)[0])"
        HandleAPi.CallAPiwith(url: url, parameter: [:], method: .get, model: ProductsListModel.self, header : [:] ) { [self] resp, err in
            print("product List",resp)
            if let status = resp.status{
                if status == 200{
                    print("got it ")
                    model = resp.data
                    delegate?.handleAPi()
                    

                }
                else{
                
                    print("ERRor is ",resp.message ?? "")
                }
                
            }
           
            
        }
        
    }
}
