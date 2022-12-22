//
//  OrderProductsModel.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 08/12/22.
//

import Foundation

struct OrderListModel : Codable {
    let status : Int?
    let data : [OrderProducts]?
    let message : String?
    let user_msg : String?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
        case message = "message"
        case user_msg = "user_msg"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        data = try values.decodeIfPresent([OrderProducts].self, forKey: .data)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        user_msg = try values.decodeIfPresent(String.self, forKey: .user_msg)
    }

}

struct OrderProducts : Codable {
    let id : Int?
    let cost : Int?
    let created : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case cost = "cost"
        case created = "created"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        cost = try values.decodeIfPresent(Int.self, forKey: .cost)
        created = try values.decodeIfPresent(String.self, forKey: .created)
    }

}

