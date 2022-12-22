//
//  OrderDetailsViewController.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 09/12/22.
//

import UIKit

class OrderDetailsViewController: BaseViewController {
    @IBOutlet weak var orderDetailTable: UITableView!
    @IBOutlet weak var pageTitle: UILabel!
    
    var OrderDetailsTableViewCell = "OrderDetailsTableViewCell"
    var cartFooterTableViewCell = "cartFooterTableViewCell"
    var profileTitle : String?
    let vm = OrderDetailsViewModel()
    var param : [String:Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startLoader()
        vm.delegate = self
        vm.updateAcc(param: param)
        orderDetailTable.delegate = self
        orderDetailTable.dataSource = self
        orderDetailTable.register(UINib(nibName: OrderDetailsTableViewCell, bundle: nil), forCellReuseIdentifier: OrderDetailsTableViewCell)
        orderDetailTable.register(UINib(nibName: cartFooterTableViewCell, bundle: nil), forCellReuseIdentifier: cartFooterTableViewCell)
    }
    
    @IBAction func goBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
}

extension OrderDetailsViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.ProfileData?.order_details?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == vm.ProfileData?.order_details?.count{
            let FooterCell = tableView.dequeueReusableCell(withIdentifier: cartFooterTableViewCell, for: indexPath) as! cartFooterTableViewCell
            FooterCell.OrderNowBtn.isHidden = true
            FooterCell.TotalCost.text = "₹ \(vm.ProfileData?.cost ?? 0)"
            return FooterCell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: OrderDetailsTableViewCell, for: indexPath) as! OrderDetailsTableViewCell
            cell.ProductName.text = vm.ProfileData?.order_details?[indexPath.row].prod_name
            cell.ProductDesc.text = vm.ProfileData?.order_details?[indexPath.row].prod_cat_name
            cell.productQty.text = "QTY :  \(vm.ProfileData?.order_details?[indexPath.row].quantity ?? 0)"
            cell.productPRice.text = "₹ \(vm.ProfileData?.order_details?[indexPath.row].total ?? 0)"
            cell.productImg.downloaded(from: vm.ProfileData?.order_details?[indexPath.row].prod_image ?? "", contentMode: .scaleToFill)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 5
    }
    
    
}

extension OrderDetailsViewController : HandleOrderDetailsAPiProtocol{
    func handleAPi(_ msg: String) {
        print("done")
        pageTitle.text = "Order ID : \(vm.ProfileData?.id ?? 0)"
        orderDetailTable.reloadData()
        self.stopLoader()
    }
    
    func handleError(_ msg: String) {
        print("errrr")
    }
    
    
}
