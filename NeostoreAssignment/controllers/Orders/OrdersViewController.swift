//
//  OrdersViewController.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 08/12/22.
//

import UIKit

class OrdersViewController: BaseViewController {
    @IBOutlet weak var OrdersTable: UITableView!
    
    let OrderTableViewCell = "OrderTableViewCell"
    let VM = getOrderProductListViewModel()
    
    @IBAction func goBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startLoader()
        VM.delegate = self
        VM.getOrderList()
        OrdersTable.register(UINib(nibName: OrderTableViewCell, bundle: nil), forCellReuseIdentifier: OrderTableViewCell)
        OrdersTable.delegate = self
        OrdersTable.dataSource = self
        
    }
}

extension OrdersViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VM.orderList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderTableViewCell, for: indexPath) as! OrderTableViewCell
        cell.OrderPrice.text = "₹ \(VM.orderList?[indexPath.row].cost ?? 0).00"
        cell.orderDate.text = "Ordered Date : \(VM.orderList?[indexPath.row].created ?? "")"
        cell.orderId.text = "Order ID : \(VM.orderList?[indexPath.row].id ?? 0)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height/7
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "OrderDetailsViewController") as! OrderDetailsViewController
        nextVc.param = ["order_id" : VM.orderList?[indexPath.row].id ?? 0]
        navigationController?.pushViewController(nextVc, animated: true)
        
    }
    
}

extension OrdersViewController : orderNowProto{
    func success(_ msg: String) {
        OrdersTable.reloadData()
        self.stopLoader()
    }
    
    
    func failure(_ msg: String) {
        self.stopLoader()
    }
    
    
}
