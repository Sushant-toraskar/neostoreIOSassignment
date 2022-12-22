//
//  ProductDetailViewController.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 22/11/22.
//

import UIKit

class ProductDetailViewController: BaseViewController,NavigateToCart {
    func navigateToCart(_ success: Bool) {
        if success == true{
            let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "CartViewController")
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    
    
    @IBOutlet weak var prodMainImage: UIImageView!
    @IBOutlet weak var productImgCollection: UICollectionView!
    @IBOutlet weak var ProductName: UILabel!
    @IBOutlet weak var ProductType: UILabel!
    @IBOutlet weak var ProdDesc: UILabel!
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    @IBOutlet weak var prodCost: UILabel!
    @IBOutlet weak var prodDescription: UILabel!

    

    let productImagesCollectionViewCell = "productImagesCollectionViewCell"
    var test = true
    var imgArr = [UIImage(named: "slider_img1"),UIImage(named: "slider_img2"),UIImage(named: "slider_img3"),UIImage(named: "slider_img4"),UIImage(named: "slider_img4")]
    

    var VM = ProductDetailViewModel()
    var paramID = 0
    var productCategory = ""
    
    
    
    
    @IBAction func handleBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    static func loadNib(id:Int,category : String) -> ProductDetailViewController{
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ProductDetailViewController") as! ProductDetailViewController
        vc.paramID = id
        vc.productCategory = category
        return vc
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startLoader()
        VM.delegate = self
        VM.returnData(["product_id": paramID])

        self.navigationController?.isNavigationBarHidden = true
        changeStatusBarBG(color: .red)
        productImgCollection.delegate = self
        productImgCollection.dataSource = self
        productImgCollection.register(UINib(nibName: productImagesCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: productImagesCollectionViewCell)
        
        // setting data from api
        
        
        
        //modal handle
        
       
    }
    
    @IBAction func handleBuyNow(_ sender : Any){

        let nextvc = modalViewController.loadNib(toggle: true, imgLink: VM.responceData?.data?.product_images?[0].image ?? "",prodname: VM.responceData?.data?.getName ?? "NA",id: paramID)
        navigationController?.present(nextvc, animated: true, completion: {
            print("model is presented 1234")
            nextvc.delegate = self
        })

    }
    
    @IBAction func handleRating(_ sender : Any){

        let nextvc = modalViewController.loadNib(toggle: false, imgLink: VM.responceData?.data?.product_images?[0].image ?? "",prodname: VM.responceData?.data?.getName ?? "NA",id: paramID)
        navigationController?.present(nextvc, animated: true, completion: {
            
                
        
            print("model is presented")
        })

       
    }
    

}

extension ProductDetailViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return VM.responceData?.data?.product_images?.count ?? 0

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productImagesCollectionViewCell, for: indexPath) as! productImagesCollectionViewCell
        cell.productImg.layer.borderWidth = 1.0
        cell.productImg.layer.borderColor = UIColor.black.cgColor
        cell.productImg.downloaded(from: VM.responceData?.data?.product_images?[indexPath.row].image ?? "", contentMode: .scaleAspectFill)

        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: productImgCollection.frame.width/3, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? productImagesCollectionViewCell{
            cell.productImg.layer.borderColor = UIColor.red.cgColor
            prodMainImage.downloaded(from: VM.responceData?.data?.product_images?[indexPath.row].image ?? "", contentMode: .scaleAspectFill)

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? productImagesCollectionViewCell{
            cell.productImg.layer.borderColor = UIColor.black.cgColor
        }
    }
}

extension ProductDetailViewController : HandleProdDetailsAPiProtocol{
    func handleAPi() {
        if let cost = VM.responceData?.data?.cost{
            DispatchQueue.main.async {
                self.ProductName.text = self.VM.responceData?.data?.getName
                self.prodCost.text = "RS. \(cost)"
                self.ProdDesc.text =  self.VM.responceData?.data?.producer
                self.prodDescription.text =  self.VM.responceData?.data?.description
                self.ProductType.text = "Category - \(self.productCategory)"
                self.showStars(noOFStars:  self.VM.responceData?.data?.rating ?? 0)
                self.prodMainImage.downloaded(from: self.VM.responceData?.data?.product_images?[0].image ?? "", contentMode: .scaleAspectFill)
            }
        }
        self.productImgCollection.reloadData()
        self.stopLoader()
    }
    
    func handleError(_ msg: String) {
        print("err",msg)
//        showError(msg, self: self)
        self.stopLoader()
    }
    
    
    
    
    func showStars(noOFStars num : Int){
        switch num {
        case 0 :
            star1.image = UIImage(named: "star_unchek")
            star2.image = UIImage(named: "star_unchek")
            star3.image = UIImage(named: "star_unchek")
            star4.image = UIImage(named: "star_unchek")
            star5.image = UIImage(named: "star_unchek")
            
        case 1 :
            star1.image = UIImage(named: "star_check")
            star2.image = UIImage(named: "star_unchek")
            star3.image = UIImage(named: "star_unchek")
            star4.image = UIImage(named: "star_unchek")
            star5.image = UIImage(named: "star_unchek")
            
        case 2 :
            star1.image = UIImage(named: "star_check")
            star2.image = UIImage(named: "star_check")
            star3.image = UIImage(named: "star_unchek")
            star4.image = UIImage(named: "star_unchek")
            star5.image = UIImage(named: "star_unchek")
            
        case 3 :
            star1.image = UIImage(named: "star_check")
            star2.image = UIImage(named: "star_check")
            star3.image = UIImage(named: "star_check")
            star4.image = UIImage(named: "star_unchek")
            star5.image = UIImage(named: "star_unchek")
            
        case 4 :
            star1.image = UIImage(named: "star_check")
            star2.image = UIImage(named: "star_check")
            star3.image = UIImage(named: "star_check")
            star4.image = UIImage(named: "star_check")
            star5.image = UIImage(named: "star_unchek")
            
        case 5 :
            star1.image = UIImage(named: "star_check")
            star2.image = UIImage(named: "star_check")
            star3.image = UIImage(named: "star_check")
            star4.image = UIImage(named: "star_check")
            star5.image = UIImage(named: "star_check")
        default:
            print("case not found")
        }
    }
}

