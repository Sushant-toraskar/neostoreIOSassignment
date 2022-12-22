//
//  LoginAPi.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 23/11/22.
//

import Foundation
import Alamofire

class HandleAPi : NSObject{
    
    static func CallAPiwith<T: Codable> (url : String,parameter : [String:Any],method : HTTPMethod,model: T.Type,header : HTTPHeaders, completion : @escaping (_ resp: T,_ error: String?) -> ()) {
        
        AF.request(url,method: method,parameters: parameter,encoding: URLEncoding.default, headers: header).response{
            resp in
            print("resp",resp)
            do{
                if let data = resp.data{
                    let jsondata = try JSONDecoder().decode(T.self, from: data)
                    
                    completion(jsondata , nil)
                }
            }catch let err{
                print("line 40",err.localizedDescription)
            }
        } 
    }
    
}
// access specifier
// solid principles and clean architecture




