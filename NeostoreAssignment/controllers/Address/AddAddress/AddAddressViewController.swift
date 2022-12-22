//
//  AddAddressViewController.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 08/12/22.
//

import UIKit
import RealmSwift


class AddAddressViewController: UIViewController {

    @IBOutlet weak var addressol: UITextView!
    @IBOutlet weak var cityLM: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var zipCode: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var country: UITextField!
    
    
    
    
    
//    let userDefault = UserDefaults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(DatabaseHelper.shared.showData().first)
        
//        let todos = realm.objects(Address.self)


//        let add = userDefault.dictionaryWithValues(forKeys: ["address","CityLM","city","zipCode","state","country"])
//        var allAdd = [userDefault.value(forKey: "Alladd")]
//        
//            
//        allAdd.append(add)
//        userDefault.setValue(allAdd, forKey: "Alladd")
    }
    
    @IBAction func handleAddAddress(_ sender: Any) {
        let add = Address(localaddress: addressol.text, landmark: cityLM.text ?? "NA", city: city.text ?? "NA", state: state.text ?? "NA", zipcode: zipCode.text ?? "NA", country: country.text ?? "NA")
        DatabaseHelper.shared.saveData(Add: add)
        self.navigationController?.popViewController(animated: true)
//        let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "AddressViewController") as! AddressViewController
//        self.navigationController?.pushViewController(nextVC, animated: true)
//        try! realm.write({
//            realm.add(add)
//        })
//        userDefault.setValue(addressol.text, forKey: "address")
//        userDefault.setValuesForKeys(
//            [
        
//                "address": addressol.text ?? "NA",
//                "CityLM" : cityLM.text ?? "NA",
//                "city" : city.text ?? "NA",
//                "zipCode" : zipCode.text ?? "NA",
//                "state" : state.text ?? "NA",
//                "country" : country.text  ?? "NA"
//            ]
//        )
        
       
    }
    
}
