//
//  modalViewController.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 06/12/22.
//

import UIKit
import Foundation

protocol NavigateToCart {
    func navigateToCart(_ success : Bool)
}

class modalViewController: UIViewController {

    @IBOutlet weak var BuyNowView: UIView!
    @IBOutlet weak var Rating: UIView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var prodQty: UITextField!
    
    @IBOutlet weak var star1: UIButton!
    @IBOutlet weak var star2: UIButton!
    @IBOutlet weak var star3: UIButton!
    @IBOutlet weak var star4: UIButton!
    @IBOutlet weak var star5: UIButton!
    
    
    let vm = AddToCartViewModel()
    var delegate : NavigateToCart?
    var modaltoggle : Bool?
    var imageLink : String?
    var prodname : String?
    var prodId : Int?
    var toggle : Bool?
    var starCount : Int?
    
    static func loadNib(toggle : Bool,imgLink : String, prodname : String, id: Int) -> modalViewController{
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "modalViewController") as! modalViewController
        vc.modaltoggle = toggle
        vc.imageLink = imgLink
        vc.prodname = prodname
        vc.prodId = id
        return vc
    }
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vm.delegate = self
        productImage.layer.borderWidth = 1.0
        productImage.layer.borderColor = UIColor.systemGray4.cgColor
        if let toggle = modaltoggle{
        if toggle {
            BuyNowView.isHidden = false
            Rating.isHidden = true
            print(toggle)
        }else{
            print(toggle)
            BuyNowView.isHidden = true
            Rating.isHidden = false
        }
        }
        productImage.downloaded(from: imageLink ?? "", contentMode: .scaleAspectFill)
        productName.text = prodname
    }
    
    @IBAction func handleRateNow(_ sender: Any) {
       
    }
    
    @IBAction func handleBuyNow(_ sender: Any) {
        if let qty = prodQty.text, let id = prodId {
            if qty.count > 0 {
            vm.AddToCart(["product_id": id,
                          "quantity": qty])
            }else{
                showError("Enter the Quntity", self: self)
            }
        }
    }
    
    @IBAction func handleS1(_ sender: Any) {
        star1.imageView?.image = UIImage(named: "star_check")
        starCount = 1
    }
    
    @IBAction func handleS2(_ sender: Any) {
        star1.imageView?.image = UIImage(named: "star_check")
        star2.imageView?.image = UIImage(named: "star_check")
        starCount = 2
    }
    
    @IBAction func handleS3(_ sender: Any) {
        star1.imageView?.image = UIImage(named: "star_check")
        star2.imageView?.image = UIImage(named: "star_check")
        star3.imageView?.image = UIImage(named: "star_check")
        starCount = 3
    }
    @IBAction func handleS4(_ sender: Any) {
        star1.imageView?.image = UIImage(named: "star_check")
        star2.imageView?.image = UIImage(named: "star_check")
        star3.imageView?.image = UIImage(named: "star_check")
        star4.imageView?.image = UIImage(named: "star_check")
        starCount = 4
    }
    
    @IBAction func handleS5(_ sender: Any) {
        star1.imageView?.image = UIImage(named: "star_check")
        star2.imageView?.image = UIImage(named: "star_check")
        star3.imageView?.image = UIImage(named: "star_check")
        star4.imageView?.image = UIImage(named: "star_check")
        star5.imageView?.image = UIImage(named: "star_check")
        starCount = 5
    }
    
    
    
}

extension modalViewController : CartProtocol{
    
    func success(_ msg: String) {
        
        self.dismiss(animated: true, completion: nil)
        delegate?.navigateToCart(true)
        }
    
    func failure(_ err: String) {
        
        self.dismiss(animated: true, completion: nil)
        showError(err, self: self)
        toggle = false
    }
}
