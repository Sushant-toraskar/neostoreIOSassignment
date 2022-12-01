//
//  ForgetPassModel.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 30/11/22.
//

import Foundation
struct ForgetPassModel : Codable {
    let status : Int?
    let message : String?
    let user_msg : String?
    
    enum CodingKeys: String, CodingKey {
        
        case status = "status"
        case message = "message"
        case user_msg = "user_msg"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        user_msg = try values.decodeIfPresent(String.self, forKey: .user_msg)
    }
}
