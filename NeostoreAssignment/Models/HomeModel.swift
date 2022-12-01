//
//  HomeModel.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 30/11/22.
//

import Foundation

struct HomeModel : Codable {
    let status : Int?
    let data : Data?
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
        data = try values.decodeIfPresent(Data.self, forKey: .data)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        user_msg = try values.decodeIfPresent(String.self, forKey: .user_msg)
    }

}

struct Data : Codable {
    let user_data : LoginData?
    let product_categories : [Product_categories]?
    let total_carts : Int?
    let total_orders : Int?

    enum CodingKeys: String, CodingKey {

        case user_data = "user_data"
        case product_categories = "product_categories"
        case total_carts = "total_carts"
        case total_orders = "total_orders"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        user_data = try values.decodeIfPresent(LoginData.self, forKey: .user_data)
        product_categories = try values.decodeIfPresent([Product_categories].self, forKey: .product_categories)
        total_carts = try values.decodeIfPresent(Int.self, forKey: .total_carts)
        total_orders = try values.decodeIfPresent(Int.self, forKey: .total_orders)
    }

}


struct Product_categories : Codable {
    let id : Int?
    let name : String?
    let icon_image : String?
    let created : String?
    let modified : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case icon_image = "icon_image"
        case created = "created"
        case modified = "modified"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        icon_image = try values.decodeIfPresent(String.self, forKey: .icon_image)
        created = try values.decodeIfPresent(String.self, forKey: .created)
        modified = try values.decodeIfPresent(String.self, forKey: .modified)
    }

}
