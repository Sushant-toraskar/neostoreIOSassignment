//
//  AddressViewController.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 08/12/22.
//

import UIKit

class AddressViewController: UIViewController {
    
    var addressFooterTableViewCell = "addressFooterTableViewCell"
    var addressTableViewCell = "addressTableViewCell"
    var addressList = DatabaseHelper.shared.showData()
    var placeorder : Int?
    var vm = addOrderProductViewModel()
    
    @IBOutlet weak var addressTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addressTable.register(UINib(nibName: addressTableViewCell, bundle: nil), forCellReuseIdentifier: addressTableViewCell)
        addressTable.register(UINib(nibName: addressFooterTableViewCell, bundle: nil), forCellReuseIdentifier: addressFooterTableViewCell)
        addressTable.delegate = self
        addressTable.dataSource = self
        vm.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var addressList = DatabaseHelper.shared.showData()
        self.addressTable.reloadData()
    }
    
    
    @IBAction func goBackbtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    @IBAction func addAddressBtn(_ sender: Any) {
        let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "AddAddressViewController") as! AddAddressViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func deleteAddress(){
        print("place",placeorder)
        addressTable.reloadData()
    }
    
    @objc func navigateToNext(){
        if placeorder != nil{
            vm.addOrderProduct(body: ["address":"\(addressList[placeorder!].localaddress) \(addressList[placeorder!].landmark) \(addressList[placeorder!].city) -\(addressList[placeorder!].zipcode) \(addressList[placeorder!].state)  \(addressList[placeorder!].country)"])
//        let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "OrdersViewController") as! OrdersViewController
//        navigationController?.pushViewController(nextVC, animated: true)
        }
    }

}

extension AddressViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressList.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row != addressList.count{
            let addresscell = tableView.dequeueReusableCell(withIdentifier: addressTableViewCell, for: indexPath) as! addressTableViewCell
            addresscell.AddressLabel.text = "\(addressList[indexPath.row].localaddress) \(addressList[indexPath.row].landmark) \(addressList[indexPath.row].city) -\(addressList[indexPath.row].zipcode) \(addressList[indexPath.row].state)  \(addressList[indexPath.row].country)"
            addresscell.deleteAddress.addTarget(self, action: #selector(deleteAddress), for: .touchUpInside)
            if addresscell.deleteToggle {
                DatabaseHelper.shared.deleteData(ind: indexPath.row)
                addressList = DatabaseHelper.shared.showData()
                addressTable.reloadData()
                addresscell.radioBtn.imageView?.image = UIImage(named: "chky")
                addresscell.deleteToggle = false
            }
            
//            addresscell.deleteAddress.addTarget(self, action: #selector(deleteAddress), for: .touchUpInside)
            return addresscell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: addressFooterTableViewCell, for: indexPath) as! addressFooterTableViewCell
            cell.placeOrderOL.addTarget(self, action: #selector(navigateToNext), for: .touchUpInside)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height/5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Taped ",placeorder)
        if indexPath.row != addressList.count{
            let cell = tableView.cellForRow(at: indexPath) as! addressTableViewCell
            cell.radioBtn.imageView?.image = UIImage(named: "chkn")
            placeorder = indexPath.row
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if indexPath.row != addressList.count{
            let cell = tableView.cellForRow(at: indexPath) as! addressTableViewCell
            cell.radioBtn.imageView?.image = UIImage(named: "chky")
        }
    }
    
}

extension AddressViewController : orderNowProto{
    func success(_ msg: String) {
        
    }
    
    func failure(_ msg: String) {
        
    }
    
    
}
