//
//  ProductDetailViewController.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 22/11/22.
//

import UIKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var prodMainImage: UIImageView!
    @IBOutlet weak var productImgCollection: UICollectionView!
    let productImagesCollectionViewCell = "productImagesCollectionViewCell"
    var test = true
    var imgArr = [UIImage(named: "slider_img1"),UIImage(named: "slider_img2"),UIImage(named: "slider_img3"),UIImage(named: "slider_img4"),UIImage(named: "slider_img4")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        changeStatusBarBG(color: .red)
        productImgCollection.delegate = self
        productImgCollection.dataSource = self
        productImgCollection.register(UINib(nibName: productImagesCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: productImagesCollectionViewCell)
    
    }
    

}

extension ProductDetailViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productImagesCollectionViewCell, for: indexPath) as! productImagesCollectionViewCell
            cell.productImg.layer.borderWidth = 1.0
            cell.productImg.layer.borderColor = UIColor.black.cgColor
            cell.productImg.image = imgArr[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: productImgCollection.frame.width/3, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? productImagesCollectionViewCell{
            cell.productImg.layer.borderColor = UIColor.red.cgColor
            prodMainImage.image = imgArr[indexPath.row]
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? productImagesCollectionViewCell{
            cell.productImg.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    
}
