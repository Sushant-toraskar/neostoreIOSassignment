//
//  EditAccountViewController.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 09/12/22.
//

import UIKit

class EditAccountViewController: BaseViewController {
    
    var vm = HomeViewModel()
    var updateVM = UpdateAccountViewModel()
    
    let DOBPicker = UIDatePicker()
    let toolbar = UIToolbar()
    
    let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDOB))
    let imgPicker = UIImagePickerController()
    
    @IBOutlet weak var Fname: customtextfield!
    @IBOutlet weak var Lname: customtextfield!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var mail: customtextfield!
    @IBOutlet weak var phonr: customtextfield!
    @IBOutlet weak var DOB: customtextfield!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateVM.delegate = self
        imgPicker.delegate = self
        
        if let fname = vm.ProfileData?.first_name, let lname = vm.ProfileData?.last_name, let Email = vm.ProfileData?.email, let number = vm.ProfileData?.phone_no{
            Fname.text = fname
            Lname.text = lname
            mail.text = Email
            phonr.text = number
            Fname.text = fname
        }
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleAddImg))
        profileImg.isUserInteractionEnabled = true
        profileImg.addGestureRecognizer(tapGesture)
        
        DOB.text = vm.ProfileData?.dob ?? "NA"
        DOB.addTarget(self, action: #selector(handleDOB), for: .touchUpInside)
        DOB.inputView = DOBPicker
        DOBPicker.datePickerMode = .date
        DOBPicker.preferredDatePickerStyle = .wheels
        DOBPicker.maximumDate = Date()
        toolbar.sizeToFit()
        toolbar.items = [ doneBtn ]
        DOB.inputAccessoryView = toolbar
        profileImg.layer.cornerRadius = profileImg.frame.height / 2
        // Do any additional setup after loading the view.
    }
    
    @objc func handleDOB(){
        print("DOB")
        let datePicker = DateFormatter()
        datePicker.dateFormat = "dd-MM-yyyy"
        DOB.text = datePicker.string(from: DOBPicker.date)
        DOB.endEditing(true)
    }

    @objc func handleAddImg(){
        let alert = UIAlertController(title: "Choose media", message: "Please select the way", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Open Camera", style: .default) { _ in
            
            self.dismiss(animated: true, completion: nil)
            self.handleOpenCamera()
        }
        let galleryAction = UIAlertAction(title: "Open Gallery", style: .default) { _ in
            self.dismiss(animated: true, completion: nil)
            self.handleOpenGallery()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(cameraAction)
        alert.addAction(galleryAction)
        alert.addAction(cancelAction)
//        alert.actions[cameraAction,galleryAction,cancelAction]
        
        self.present(alert, animated: true, completion: nil)
        
        
        

    }
    
    func handleOpenGallery(){
        
        imgPicker.allowsEditing = true
        imgPicker.sourceType = .photoLibrary
        
        present(imgPicker, animated: true, completion: nil)
    }
    
    func handleOpenCamera(){
        let toggle = UIImagePickerController.isSourceTypeAvailable(.camera)
        if toggle {
        imgPicker.allowsEditing = false
        imgPicker.sourceType = .camera
        imgPicker.cameraCaptureMode = .photo
        present(imgPicker, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Camera not found", message: "This device doesn't have camera", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func goBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func UpdateProfile(_ sender: Any) {
        self.startLoader()
        updateVM.updateAcc(parameter:
                            ["first_name": Fname.text ?? "",
                             "last_name": Lname.text ?? "" ,
                             "email": mail.text ?? "" ,
                             "dob": DOB.text ?? "" ,
                             "profile_pic": "",
                             "phone_no": "\(phonr.text ?? "")" ] )
        
    }
    
   
}

extension EditAccountViewController : HandleUpdateAccAPiProtocol{
    func handleAPi(_ msg: String) {
        self.stopLoader()
        navigationController?.popViewController(animated: true)
    }
    
    func handleError(_ msg: String) {
        showError(msg, self: self)
    }
    
    
}

extension EditAccountViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        let image = info[.editedImage]
        if let img = info[.editedImage] as? UIImage{
            profileImg.image = img
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
