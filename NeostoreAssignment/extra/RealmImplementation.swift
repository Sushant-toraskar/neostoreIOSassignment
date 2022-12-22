//
//  RealmImplementation.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 13/12/22.
//


import Foundation
import RealmSwift


class Address : Object {
 
    @Persisted var localaddress : String = ""
    @Persisted var landmark : String = ""
    @Persisted var city : String = ""
    @Persisted var state : String = ""
    @Persisted var zipcode : String = ""
    @Persisted var country : String = ""

    convenience init(localaddress: String,landmark : String,city: String,state : String,zipcode: String,country : String) {
       self.init()
        self.localaddress = localaddress
        self.landmark = landmark
        self.city = city
        self.state = state
        self.state = state
        self.zipcode = zipcode
        self.country = country
    }
}



//class Address {
//    @objc dynamic var localaddress = ""
//    @objc dynamic var landmark = ""
//    @objc dynamic var city = ""
//    @objc dynamic var state = ""
//    @objc dynamic var zipcode = ""
//    @objc dynamic var country = ""
//
//
//    static func create(withName arr : [String]) -> Address {
//        let address = Address()
//        for num in 0...arr.count{
//            address.localaddress = arr[num]
//        }
//
//
//        return address
//    }
//
//    class Store {
//        @objc dynamic var ID = ""
//        var addressList = []
//
//        static func create(withName name: String,
//                           address: [Address]) -> Store {
//            let store = Store()
//            store.ID = name
//            store.addressList.append(address)
//
//            return store
//        }
//    }
//}
