//
//  OrderDetailsModel.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 15/12/22.
//

import Foundation

struct OrderDetailsModel : Codable {
    let status : Int?
    let data : OrderDetailsData?
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
        data = try values.decodeIfPresent(OrderDetailsData.self, forKey: .data)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        user_msg = try values.decodeIfPresent(String.self, forKey: .user_msg)
    }

}

struct OrderDetailsData : Codable {
    let id : Int?
    let cost : Int?
    let address : String?
    let order_details : [Order_details]?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case cost = "cost"
        case address = "address"
        case order_details = "order_details"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        cost = try values.decodeIfPresent(Int.self, forKey: .cost)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        order_details = try values.decodeIfPresent([Order_details].self, forKey: .order_details)
    }
}

struct Order_details : Codable {
    let id : Int?
    let order_id : Int?
    let product_id : Int?
    let quantity : Int?
    let total : Int?
    let prod_name : String?
    let prod_cat_name : String?
    let prod_image : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case order_id = "order_id"
        case product_id = "product_id"
        case quantity = "quantity"
        case total = "total"
        case prod_name = "prod_name"
        case prod_cat_name = "prod_cat_name"
        case prod_image = "prod_image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        order_id = try values.decodeIfPresent(Int.self, forKey: .order_id)
        product_id = try values.decodeIfPresent(Int.self, forKey: .product_id)
        quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
        total = try values.decodeIfPresent(Int.self, forKey: .total)
        prod_name = try values.decodeIfPresent(String.self, forKey: .prod_name)
        prod_cat_name = try values.decodeIfPresent(String.self, forKey: .prod_cat_name)
        prod_image = try values.decodeIfPresent(String.self, forKey: .prod_image)
    }

}
