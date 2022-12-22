//
//  SignUpPageViewController.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 09/11/22.
//

import UIKit

class SignUpPageViewController: BaseViewController, UIGestureRecognizerDelegate {


    @IBOutlet weak var maleimg: UIImageView!
    @IBOutlet weak var femaleImg: UIImageView!
    @IBOutlet weak var termsBtn: UIStackView!
    @IBOutlet weak var checkbox: UIImageView!
    var gender : Bool!
    var checkterms = false
    
    var vM =  RegisterViewModel()
    let parameter = ["first_name":"sush",
                     "last_name":"tor",
                     "email":"cehela8579@xegge.com",
                     "password":"password1",
                     "confirm_password":"password1",
                     "gender": "M",
                     "phone_no": 77150200100] as [String : Any]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.assignBackground()
        navigationController?.isNavigationBarHidden = false
        addTapGesture()
        vM.delegate = self
        
    }
    
    func addTapGesture(){
        let Maletapgesture = UITapGestureRecognizer(target: self, action: #selector(Maletapgestureaction))
        let Femaletapgesture = UITapGestureRecognizer(target: self, action: #selector(Femaletapgestureaction))
        let termsTapGesture = UITapGestureRecognizer(target: self, action: #selector(termsactionhandler))
        termsBtn.addGestureRecognizer(termsTapGesture)
        termsBtn.isUserInteractionEnabled = true
        maleimg.addGestureRecognizer(Maletapgesture)
        maleimg.isUserInteractionEnabled = true
        femaleImg.addGestureRecognizer(Femaletapgesture)
        femaleImg.isUserInteractionEnabled = true
    }
    
    @objc func Maletapgestureaction(){
        maleimg.image = UIImage(named: "chky")
        femaleImg.image = UIImage(named: "chkn")
        
//        if gender == true{
            gender = true
//        }
    }
    @objc func Femaletapgestureaction(){
        femaleImg.image = UIImage(named: "chky")
        maleimg.image = UIImage(named: "chkn")
        
//        if gender == false{
            gender = false
//        }
    }
    @IBAction func submitBtn(_ sender: Any) {
        vM.returnData(parameter: parameter)
        self.startLoader()
    }
    
    @objc func termsactionhandler(){
//        checkbox.image = UIImage(named: "")
        if checkterms == true{
            checkterms = false
            checkbox.image = UIImage(named: "uncheck_icon")
        }else{
            checkterms = true
            checkbox.image = UIImage(named: "checked_icon")
        }
    }
}

extension SignUpPageViewController : HandleAPiProtocol{
    func handleAPi(_ resp: RegisterModel) {
        successAlert(resp.message!, self: self)
        self.stopLoader()
    }
    
    func handleError(_ msg : String) {
        showError(msg, self: self)
        self.stopLoader()
    }
    
}
