//
//  customModal.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 30/11/22.
//

import Foundation
import UIKit


func successAlert(_ msg : String,self : UIViewController){
    let alert = UIAlertController(title: "Success", message: msg, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
    self.present(alert, animated: true, completion: nil)
}

func showError(_ error : String,self : UIViewController){
    let alert = UIAlertController(title: "Alert", message: error, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
    self.present(alert, animated: true, completion: nil)
}




