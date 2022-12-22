//
//  CartViewController.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 02/12/22.
//

import UIKit

class CartViewController: BaseViewController {

    @IBOutlet weak var CartTableView: UITableView!
    
    var CartProdTableViewCell = "CartProdTableViewCell"
    var cartFooterTableViewCell = "cartFooterTableViewCell"
    
    let vm = getCartViewModel()
    let dvm = deleteCartViewModel()
    let edm = editCartViewModel()
    
    
    let cartview = UIImageView()
    
    
    @IBAction func goBackbtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    //    static func loadnib(category : String) -> CartViewController{
//        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "CartViewController") as! CartViewController
//        vc.category = category
//       return vc
//    }
    
    override func viewDidLoad() {
        self.startLoader()
        super.viewDidLoad()
        cartview.image = UIImage(named: "Empty_cart")
//        cartview.frame = self.CartTableView.frame
        cartview.frame = CGRect(x: 0 , y: 0 , width: self.CartTableView.frame.width * 0.6 , height: self.CartTableView.frame.height * 0.6)
        cartview.center = self.CartTableView.center
//        cartview.isHidden = true
        vm.getcart()
        
        
        
        
       
        CartTableView.register(UINib(nibName:CartProdTableViewCell, bundle: nil), forCellReuseIdentifier: CartProdTableViewCell)
        
        CartTableView.register(UINib(nibName: cartFooterTableViewCell, bundle: nil), forCellReuseIdentifier: cartFooterTableViewCell)
        
        CartTableView.delegate = self
        CartTableView.dataSource = self
        vm.delegate = self
        dvm.delegate = self
        edm.delegate = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.startLoader()
        vm.getcart()
//        if (vm.cartData?.data == nil){
//            handleEmptyCart()
//        }else{
//            removeEmptyCartImg()
//        }
//        CartTableView.reloadData()
    }
    
    func handleEmptyCart(){
        
//        cartview.backgroundColor = .black
        self.view.addSubview(cartview)
    }
    func removeEmptyCartImg(){
        self.view.willRemoveSubview(cartview)
    }
    
    @objc func navigateToOrderNow(){
        let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "AddressViewController") as! AddressViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
extension CartViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = vm.cartData?.data?.count{
            print("cart count",count + 1)
            return (count + 1)
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row != vm.cartData?.data?.count ?? 0 + 1{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: CartProdTableViewCell, for: indexPath) as! CartProdTableViewCell
            cell.cartProdName.text = vm.cartData?.data?[indexPath.row].getProduct?.name
            cell.cartProdImg.downloaded(from: vm.cartData?.data?[indexPath.row].getProduct?.product_images ?? "", contentMode: .scaleAspectFill)
            cell.cartProdPrice.text = "Rs.\(vm.cartData?.data?[indexPath.row].getProduct?.sub_total ?? 0)"
            cell.cartProdDesc.text = "(\(vm.cartData?.data?[indexPath.row].getProduct?.product_category ?? "NA"))"
            cell.cartProdCount.text = "\(vm.cartData?.data?[indexPath.row].quantity ?? 0)"
            cell.dropDown.selectionAction = {
                (index : Int,item : String) in
                if cell.cartProdCount.text != item{
                    //                    cell.cartProdCount.text = item
                    self.edm.editCartProd(["product_id": self.vm.cartData?.data?[indexPath.row].product_id ?? 0,
                                           "quantity": item])
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.vm.getcart()
                        self.CartTableView.reloadData()
                    }
                }
                
            }
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: cartFooterTableViewCell, for: indexPath) as! cartFooterTableViewCell
            cell.TotalCost.text = "₹ \(vm.cartData?.total ?? 0)"
            cell.OrderNowBtn.addTarget(self, action: #selector(navigateToOrderNow), for: .touchUpInside)
            
            
            return cell
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: ""){(_, _, completionHandler) in
            //            self.StartLoader(true)
            self.dvm.deleteCartProd(["product_id" : self.vm.cartData?.data?[indexPath.row].product_id ?? 0])
            self.startLoader()
            self.vm.getcart()
            self.CartTableView.reloadData()
            completionHandler(true)
            
        }
        deleteAction.image = UIImage(named: "delete")
        deleteAction.backgroundColor = .white
        if indexPath.row != 3{
            let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
            return configuration
        }else{
            let configuration = UISwipeActionsConfiguration(actions: [])
            return configuration
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    
    
    
}

extension CartViewController : CartProtocol{
    func success(_ msg: String) {
        self.CartTableView.reloadData()
        
        if (vm.cartData?.data == nil){
            handleEmptyCart()
        }else{
            removeEmptyCartImg()
        }
        self.stopLoader()
    }
    
    func failure(_ err: String) {
        self.stopLoader()
    }
    
    
}
