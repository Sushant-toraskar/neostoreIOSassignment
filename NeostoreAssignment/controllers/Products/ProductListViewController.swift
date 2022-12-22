

import UIKit

class ProductListViewController: UIViewController {

    @IBOutlet weak var ProductListTable: UITableView!
    @IBOutlet weak var productListTitle: UILabel!
    let ProductListTableViewCell = "ProductListTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProductListTable.register(UINib(nibName: ProductListTableViewCell, bundle: nil), forCellReuseIdentifier: ProductListTableViewCell)
        navigationController?.isNavigationBarHidden = true
    }
    
    
    
    @IBAction func handleSearch(_ sender: Any) {
        
    }
    @IBAction func handleBack(_ sender: Any) {
        
    }
}

extension ProductListViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductListTableViewCell, for: indexPath) as! ProductListTableViewCell
        cell.showStars(noOFStars: 3)
        cell.ProductName.text = "TableNo 1"
        return  cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height/6
    }
    
    
}
