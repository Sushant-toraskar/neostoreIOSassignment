//
//  DatabaseHandler.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 12/12/22.
//

import RealmSwift
import UIKit

class DatabaseHelper{
    
    static let shared = DatabaseHelper()

    private let realm = try! Realm()
    
    func saveData(Add : Address){
        try! realm.write({
            realm.add(Add)
        })
    }

    
    func showData<Element: Address>() ->  Results<Element>{
        let address = realm.objects(Element.self)
        return address
    }
    
    func deleteData(ind : Int){
        let deletingAdd = realm.objects(Address.self)[ind]
        try! realm.write({
            realm.delete(deletingAdd)
        })
    }
}


