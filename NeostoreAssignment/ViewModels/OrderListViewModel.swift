//
//  OrderListViewModel.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 08/12/22.
//

import Foundation

protocol orderNowProto {
    func success(_ msg : String)
    func failure(_ msg : String)
}

class getOrderProductListViewModel{
    var delegate : orderNowProto?
    var orderList : [OrderProducts]?
    
    func getOrderList(){
        let url = "http://staging.php-dev.in:8844/trainingapp/api/orderList"
        HandleAPi.CallAPiwith(url: url, parameter: [:], method: .get, model: OrderListModel.self, header : ["access_token" : "637ddf53f2d43"] ) { [self] resp, err in
            print("product added to cart",resp,err ?? "err")
            if let status = resp.status {
                if status == 200 {
                    print("got it ")
                    orderList = resp.data
                    delegate?.success("")
                }
                else{
                    delegate?.failure(resp.user_msg ?? "NA")
                }
            }
        }
    }
    
}


class addOrderProductViewModel{
    var delegate : orderNowProto?
    
    func addOrderProduct(body parameter : [String : Any]){
        let url = "http://staging.php-dev.in:8844/trainingapp/api/order"
        HandleAPi.CallAPiwith(url: url, parameter: parameter, method: .post, model: OrderListModel.self, header : ["access_token" : "637ddf53f2d43"] ) { [self] resp, err in
            
            if let status = resp.status,let msg = resp.user_msg {
                if status == 200 {
                    delegate?.success(msg)
                }
                else{
                    delegate?.failure(msg)
                }
            }
        }
    }
    
}
