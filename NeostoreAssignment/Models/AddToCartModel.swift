//
//  CartModel.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 05/12/22.
//

import Foundation


struct AddDeleteCartModel : Codable {
    let status : Int?
    let data : Bool?
    let total_carts : Int?
    let message : String?
    let user_msg : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case data = "data"
        case total_carts = "total_carts"
        case message = "message"
        case user_msg = "user_msg"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        total_carts = try values.decodeIfPresent(Int.self, forKey: .total_carts)
        data = try values.decodeIfPresent(Bool.self, forKey: .data)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        user_msg = try values.decodeIfPresent(String.self, forKey: .user_msg)
    }

}
