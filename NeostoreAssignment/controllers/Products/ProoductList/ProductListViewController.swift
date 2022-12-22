

import UIKit

//protocol handleParameterPassing {
//    func passparameter(_ params : [String : Int],_ prodName : String)
//}

class ProductListViewController: BaseViewController {

    @IBOutlet weak var ProductListTable: UITableView!
    @IBOutlet weak var productListTitle: UILabel!
    let ProductListTableViewCell = "ProductListTableViewCell"
    
    
    lazy var vm = ProductListViewModel()
    var titleData = ""
    var Id = 0
    func parameterPassing(_ params : [String : Int], name : String){
        print("Name",name)
        print("passed")
    }
    
    static func loadNib(id:Int, Title:String) -> ProductListViewController{
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "productList") as! ProductListViewController
        vc.Id = id
        vc.titleData = Title
        return vc
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startLoader()
        
        ProductListTable.register(UINib(nibName: ProductListTableViewCell, bundle: nil), forCellReuseIdentifier: ProductListTableViewCell)
        navigationController?.isNavigationBarHidden = true
        vm.delegate = self
        self.productListTitle.text = titleData
        print("Title ", titleData)
        vm.returnData(["product_category_id" : Id])
    }
    
    
    
    @IBAction func handleSearch(_ sender: Any) {
       
    }
    @IBAction func handleBack(_ sender: Any) {
        print("back")
        self.navigationController?.popViewController(animated: true)
    }
}

extension ProductListViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.model?.count ?? 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductListTableViewCell, for: indexPath) as! ProductListTableViewCell
        cell.showStars(noOFStars: 3)
        if let prod = vm.model?[indexPath.row]{
            cell.ProductName.text = prod.name
            cell.productAmount.text = "Rs. \(prod.cost!)"
            cell.productDisc.text = prod.producer
            cell.showStars(noOFStars: prod.rating ?? 1)
            cell.productImg.downloaded(from: prod.product_images!, contentMode: .scaleAspectFit)
        }
        return  cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height/6
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! ProductListTableViewCell
        cell.backgroundColor = .lightGray
        let nextvc = ProductDetailViewController.loadNib(id:vm.model?[indexPath.row].id ?? 0,category: titleData)
        self.navigationController?.pushViewController(nextvc, animated: true)
        
        
        
        
        
//        let nextVc = sb.instantiateViewController(identifier: "ProductDetailViewController")
//        navigationController?.pushViewController(nextVc, animated: true)
    }
    
    
}


extension ProductListViewController : HandleProdListAPiProtocol{
    func handleAPi() {
        print("how are you")
        ProductListTable.reloadData()
        self.stopLoader()
    }
    
    func handleError(_ msg: String) {
//        showError(msg, self: self)
        self.stopLoader()
    }
}
