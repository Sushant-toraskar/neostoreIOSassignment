//
//  ProductListModel.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 01/12/22.
//

import Foundation
struct ProductsListModel : Codable {
    let status : Int?
    let data : [ProductList]?
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
        data = try values.decodeIfPresent([ProductList].self, forKey: .data)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        user_msg = try values.decodeIfPresent(String.self, forKey: .user_msg)
    }

}


struct ProductList : Codable {
    let id : Int?
    let product_category_id : Int?
    let name : String?
    let producer : String?
    let description : String?
    let cost : Int?
    let rating : Int?
    let view_count : Int?
    let created : String?
    let modified : String?
    let product_images : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case product_category_id = "product_category_id"
        case name = "name"
        case producer = "producer"
        case description = "description"
        case cost = "cost"
        case rating = "rating"
        case view_count = "view_count"
        case created = "created"
        case modified = "modified"
        case product_images = "product_images"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        product_category_id = try values.decodeIfPresent(Int.self, forKey: .product_category_id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        producer = try values.decodeIfPresent(String.self, forKey: .producer)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        cost = try values.decodeIfPresent(Int.self, forKey: .cost)
        rating = try values.decodeIfPresent(Int.self, forKey: .rating)
        view_count = try values.decodeIfPresent(Int.self, forKey: .view_count)
        created = try values.decodeIfPresent(String.self, forKey: .created)
        modified = try values.decodeIfPresent(String.self, forKey: .modified)
        product_images = try values.decodeIfPresent(String.self, forKey: .product_images)
    }

}

