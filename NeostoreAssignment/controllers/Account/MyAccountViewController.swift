//
//  MyAccountViewController.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 09/12/22.
//

import UIKit

class MyAccountViewController: BaseViewController {
    
    var vm = HomeViewModel()
    let ResetPasswordViewController = "ResetPasswordViewController"
    

    @IBOutlet weak var Fname: customtextfield!
    @IBOutlet weak var Lname: customtextfield!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var mail: customtextfield!
    @IBOutlet weak var phonr: customtextfield!
    @IBOutlet weak var DOB: customtextfield!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startLoader()
        vm.delegate = self
        vm.returnData()
        showDataInFields()
    }
    
    func showDataInFields(){
        print("data",vm.ProfileData)
        if let fname = vm.ProfileData?.first_name, let lname = vm.ProfileData?.last_name, let Email = vm.ProfileData?.email, let number = vm.ProfileData?.phone_no{
            Fname.text = fname
            Lname.text = lname
            mail.text = Email
            phonr.text = number
            profileImg.downloaded(from: vm.ProfileData?.profile_pic ?? "", contentMode: .scaleAspectFit)
            
        }
        DOB.text = vm.ProfileData?.dob ?? "NA"
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        self.startLoader()
        vm.returnData()
        
    }
    
    @IBAction func NavigateToEditProfile(_ sender: Any) {
        let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "EditAccountViewController") as! EditAccountViewController
        nextVC.vm = vm
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
    @IBAction func goBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func NavigateToResetPass(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier:ResetPasswordViewController )
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
extension MyAccountViewController : HandleHomeAPiProtocol{
    func handleAPi(_ resp: String) {
        self.stopLoader()
        showDataInFields()
    }

    func handleError(_ msg: String) {
        self.stopLoader()
    }
    
    
}
