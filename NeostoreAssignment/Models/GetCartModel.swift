//
//  GetCartModel.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 07/12/22.
//

import Foundation
struct GetCartModel : Codable {
    let status : Int?
    let data : [CartData]?
    let count : Int?
    let total : Int?
    let message : String?
    let user_msg : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case data = "data"
        case count = "count"
        case total = "total"
        case message = "message"
        case user_msg = "user_msg"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        data = try values.decodeIfPresent([CartData].self, forKey: .data)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        total = try values.decodeIfPresent(Int.self, forKey: .total)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        user_msg = try values.decodeIfPresent(String.self, forKey: .user_msg)
    }

}

struct CartData : Codable {
    let id : Int?
    let product_id : Int?
    let quantity : Int?
    private let product : CartProduct?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case product_id = "product_id"
        case quantity = "quantity"
        case product = "product"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        product_id = try values.decodeIfPresent(Int.self, forKey: .product_id)
        quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
        product = try values.decodeIfPresent(CartProduct.self, forKey: .product)
    }
    var getProduct : CartProduct?{
        return product ?? nil
    }
    
}

struct CartProduct : Codable {
    let id : Int?
    let name : String?
    let cost : Int?
    let product_category : String?
    let product_images : String?
    let sub_total : Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case cost = "cost"
        case product_category = "product_category"
        case product_images = "product_images"
        case sub_total = "sub_total"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        cost = try values.decodeIfPresent(Int.self, forKey: .cost)
        product_category = try values.decodeIfPresent(String.self, forKey: .product_category)
        product_images = try values.decodeIfPresent(String.self, forKey: .product_images)
        sub_total = try values.decodeIfPresent(Int.self, forKey: .sub_total)
    }

}

