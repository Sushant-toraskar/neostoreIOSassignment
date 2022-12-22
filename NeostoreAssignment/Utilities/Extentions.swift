//
//  Extentions.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 15/12/22.
//

import Foundation
import UIKit

extension String{
    func validateName() -> Bool {
        let nameRegex =  "[a-zA-Z]{3,18}$"
              let trimmedString = self.trimmingCharacters(in: .whitespaces)
              let validateName = NSPredicate(format: "SELF MATCHES %@", nameRegex)
              let isValidateName = validateName.evaluate(with: trimmedString)
             return isValidateName
    }
    func validatePhone() -> Bool{
        let phoneRegex = "^[6-9][0-9]{9}$"
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        let validateName = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        let isValidatePhone = validateName.evaluate(with: trimmedString)
        return isValidatePhone
    }
    
    func validateEmail() -> Bool {
        let mailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+[A-Za-z]{2,64}"
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        let validateName = NSPredicate(format: "SELF MATCHES %@", mailRegex)
        let isValidatemail = validateName.evaluate(with: trimmedString)
        return isValidatemail
    }
    
    func validatePassword() -> Bool {
        let passRegex = "[a-zA-Z0-9.@*^:;%£#<>{}&$()!]{8,}"
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        let validateName = NSPredicate(format: "SELF MATCHES %@", passRegex)
        let isValidpass = validateName.evaluate(with: trimmedString)
        return isValidpass
    }
    
    
}


extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
