//
//  ProductDetailViewModel.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 02/12/22.
//

import Foundation

struct ProductDetailModel : Codable {
    let status : Int?
    let data : Product?
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
        data = try values.decodeIfPresent(Product.self, forKey: .data)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        user_msg = try values.decodeIfPresent(String.self, forKey: .user_msg)
    }

}

struct Product : Codable {
    let id : Int?
    let product_category_id : Int?
    private let name : String?
    let producer : String?
    let description : String?
    let cost : Int?
    let rating : Int?
    let view_count : Int?
    let created : String?
    let modified : String?
    let product_images : [Product_images]?
    
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
        product_images = try values.decodeIfPresent([Product_images].self, forKey: .product_images)
    }

    var getName:String{
        return name ?? ""
    }
    
//    func getName() ->String{
//        let name = name
//
//        return name ?? ""
//    }
    
}
struct Product_images : Codable {
    let id : Int?
    let product_id : Int?
    let image : String?
    let created : String?
    let modified : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case product_id = "product_id"
        case image = "image"
        case created = "created"
        case modified = "modified"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        product_id = try values.decodeIfPresent(Int.self, forKey: .product_id)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        created = try values.decodeIfPresent(String.self, forKey: .created)
        modified = try values.decodeIfPresent(String.self, forKey: .modified)
    }

}

