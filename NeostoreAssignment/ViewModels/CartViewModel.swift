//
//  CartViewModel.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 05/12/22.
//

import Foundation
protocol CartProtocol {
    func success(_ msg : String)
    func failure(_ err : String)
}

class AddToCartViewModel{
    var delegate : CartProtocol?
    var modelData : AddDeleteCartModel?
    
    func AddToCart(_ body : [String : Any]){
        let url = "http://staging.php-dev.in:8844/trainingapp/api/addToCart"
        HandleAPi.CallAPiwith(url: url, parameter: body, method: .post, model: AddDeleteCartModel.self, header : ["access_token" : "637ddf53f2d43"] ) { [self] resp, err in
            print("product added to cart",resp,err ?? "err")
            if let status = resp.status, let data = resp.data,let msg = resp.user_msg{
                if status == 200 && data == true{
                    print("got it ")
                    delegate?.success(msg)
                }
                else{
                    delegate?.failure(msg)
                    print("ERRor is ",msg)
                }
            }
        }
    }
    
}

class getCartViewModel{
    var delegate : CartProtocol?
    var cartData : GetCartModel?
    
    func getcart(){
        let url = "http://staging.php-dev.in:8844/trainingapp/api/cart"
        HandleAPi.CallAPiwith(url: url, parameter: [:], method: .get, model: GetCartModel.self, header : ["access_token" : "637ddf53f2d43"] ) { [self] resp, err in
            print("product added to cart",resp,err ?? "err")
            if let status = resp.status {
                if status == 200 {
                    print("got it ")
                    cartData = resp
                    delegate?.success("Cart Data Fetched")
                }
                else{
                    delegate?.failure("")
                }
            }
        }
    }
    
}


class deleteCartViewModel{
    var delegate : CartProtocol?
    
    func deleteCartProd(_ body : [String:Any]){
        let url = "http://staging.php-dev.in:8844/trainingapp/api/deleteCart"
        HandleAPi.CallAPiwith(url: url, parameter: body, method: .post, model: AddDeleteCartModel.self, header : ["access_token" : "637ddf53f2d43"] ) { [self] resp, err in
            print("product added to cart",resp,err ?? "err")
            if let status = resp.status,let msg = resp.user_msg {
                if status == 200 {
                    print("got it ")
//                    cartData = resp
                    delegate?.success(msg)
                }
                else{
                    delegate?.failure("")
                }
            }
        }
    }
    
}


class editCartViewModel{
    var delegate : CartProtocol?
    
    func editCartProd(_ body : [String:Any]){
        let url = "http://staging.php-dev.in:8844/trainingapp/api/editCart"
        HandleAPi.CallAPiwith(url: url, parameter: body, method: .post, model: AddDeleteCartModel.self, header : ["access_token" : "637ddf53f2d43"] ) { [self] resp, err in
            print("product added to cart",resp,err ?? "err")
            if let status = resp.status,let msg = resp.user_msg {
                if status == 200 {
                    print("got it ")
//                    cartData = resp
                    delegate?.success(msg)
                }
                else{
                    delegate?.failure("")
                }
            }
        }
    }
    
}
