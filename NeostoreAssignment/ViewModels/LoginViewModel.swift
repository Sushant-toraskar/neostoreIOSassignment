//
//  LoginViewModel.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 23/11/22.
//

import Foundation
import Alamofire

class LoginViewModel : NSObject{
    
    var profileData : LoginData?

    func CallRegisterAPiAF(completion : @escaping (_ resp: LoginModel?,_ error: ErrModel?) -> ()) {
        let url = "http://staging.php-dev.in:8844/trainingapp/api/users/login"
        
        let parameter = [
            "email" : "yfhvhjvhv@gm.com",

            "password" : "password"
        ]
        
        AF.request(url, method: .post, parameters: parameter,encoding: URLEncoding.default).responseData { resp in
            var jsonData : LoginModel?
            switch resp.response?.statusCode{
            case 200:
                do{
                    
                    if let data = resp.data{
                        let jsondata = try JSONDecoder().decode(LoginModel.self, from: data)
                        jsonData = jsondata
                    }
                    self.profileData = jsonData?.data

                    completion(jsonData, nil)
                }catch let err{
                    print("line",err.localizedDescription)
//                    completion(nil, nil)
                }
            default:
                if let data = resp.data{
                    let errdata = try! JSONDecoder().decode(ErrModel.self, from: data)
                    print("\(errdata.status!)")
                    completion(nil, nil)
                    print("err",errdata)
                }
            }
        }
    }
    
}


