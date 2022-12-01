import UIKit

class sideMenuViewController: UIViewController {
    var menu  = false
    let screen = UIScreen.main.bounds
    var home  = CGAffineTransform()
    var profileData : LoginData?
    var sb = UIStoryboard(name: "Main", bundle: nil)
   
    
    var vm = HomeViewModel()
    
    @IBOutlet weak var SideViewTable: UITableView!
    @IBOutlet weak var HomeView: UIView!
    @IBOutlet weak var CollectionImageSlider: UICollectionView!
    @IBOutlet weak var ProductTypesCollection: UICollectionView!
    @IBOutlet weak var PageControl: UIPageControl!
    
    
    let ProfilePicCellTableViewCell = "ProfilePicCellTableViewCell"
    let CollectionViewCell = "CollectionViewCell"
    let ProductTypeCollectionViewCell = "ProductTypeCollectionViewCell"
    let SideMenuTableViewCell = "SideMenuTableViewCell"

    
    let productTypeImgList = [UIImage(named: "tableicon"),UIImage(named: "sofaicon"),UIImage(named: "chairsicon"),UIImage(named: "cupboardicon")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vm.delegate = self
        vm.returnData()
        PageControl.numberOfPages = 4
        PageControl.allowsContinuousInteraction = true
        PageControl.currentPage = 0
        
        navigationController?.isNavigationBarHidden = true
        home = self.HomeView.transform
        SideViewTable.delegate = self
        SideViewTable.dataSource = self
        CollectionImageSlider.delegate = self
        CollectionImageSlider.dataSource = self
        ProductTypesCollection.dataSource = self
        ProductTypesCollection.delegate = self
    
        SideViewTable.backgroundColor = .clear
        SideViewTable.isUserInteractionEnabled = true
        CollectionImageSlider.isUserInteractionEnabled = true
        ProductTypesCollection.isUserInteractionEnabled = true
        
        
        
        SideViewTable.register(UINib(nibName: ProfilePicCellTableViewCell, bundle: nil), forCellReuseIdentifier: ProfilePicCellTableViewCell)
        
        SideViewTable.register(UINib(nibName: SideMenuTableViewCell, bundle: nil), forCellReuseIdentifier: SideMenuTableViewCell)
        
        CollectionImageSlider.register(UINib(nibName: CollectionViewCell , bundle: nil), forCellWithReuseIdentifier: CollectionViewCell)
        
        ProductTypesCollection.register(UINib(nibName: ProductTypeCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: ProductTypeCollectionViewCell)
        
        
    }

    
    func showMenu() {
        self.HomeView.layer.cornerRadius = 40
        let x = screen.width * 0.8
        let originalTransform = self.HomeView.transform
        let scaledTransform = originalTransform.scaledBy(x: 0.8, y: 0.8)
        let scaledAndTranslatedTransform = scaledTransform.translatedBy(x: x, y: 0)
        UIView.animate(withDuration: 0.7, animations: {
            self.HomeView.transform = scaledAndTranslatedTransform
        })
    }
    
    
    func hideMenu() {
        
        UIView.animate(withDuration: 0.7, animations: {
            self.HomeView.transform = self.home
            self.HomeView.layer.cornerRadius = 0
        })
    }

    
    
    @IBAction func ShowMenu(_ sender: Any) {
        print("menu interaction")
        if menu == false {
            showMenu()
            menu = true
        }else{
            hideMenu()
            menu = false
        }
    }
    @IBAction func showMenuByDrag(_ sender: Any) {
        print("menu interaction")
        if menu == false {
            showMenu()
            menu = true
        }
    }
    
    @IBAction func CloseMenuByClick(_ sender: Any) {
        if menu == true{
            hideMenu()
            menu = false
        }
    }
    
    @objc func handleProductTap() {
        print("data")
    }
    
    
    
}


extension sideMenuViewController :  UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count + 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfilePicCellTableViewCell, for: indexPath) as! ProfilePicCellTableViewCell
            cell.backgroundColor = .clear
            if let fname = profileData?.first_name, let lname = profileData?.last_name,let mail = profileData?.email{
                cell.UserName.text = "\(fname) \(lname)"
                cell.UserMail.text = "\(mail)"
            }
            return cell
            
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuTableViewCell , for: indexPath) as! SideMenuTableViewCell
        print(indexPath.row)
        cell.RouteName.text = options[indexPath.row - 1].title
            cell.cartItems.isHidden = true
        cell.routeIcon.image = UIImage(named: options[indexPath.row - 1].icon)
            if indexPath.row == 1 {
                cell.cartItems.isHidden = false
                cell.cartItems.setTitle("2", for: .normal)
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("table clicked")
    }
}


extension sideMenuViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == ProductTypesCollection{
            return productTypeImgList.count
        }else{
            return 4
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("page controll \(scrollView.contentOffset.x) , \(view.frame.width)")
        let scrollPos = scrollView.contentOffset.x/view.frame.width
        PageControl.currentPage = Int(scrollPos)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == ProductTypesCollection{
            let productTypeCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductTypeCollectionViewCell, for: indexPath) as! ProductTypeCollectionViewCell

            
            productTypeCell.productListImg.image = productTypeImgList[indexPath.row]
            

//            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleProductTap))
//            productTypeCell.addGestureRecognizer(tapGesture)
//            productTypeCell.isUserInteractionEnabled = true
            
            return productTypeCell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell, for: indexPath) as! CollectionViewCell
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("cell")
        let nextvc = sb.instantiateViewController(identifier: "productList") as! ProductListViewController
        if collectionView == ProductTypesCollection{
            self.navigationController?.pushViewController(nextvc, animated: true)
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == ProductTypesCollection{
            return CGSize(width: collectionView.frame.width/2-5 , height: collectionView.frame.height/2 - 5)
        }else{
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
    }
}

extension sideMenuViewController : HandleHomeAPiProtocol {
    func handleAPi(_ resp: HomeModel) {
        successAlert("profile fetched", self: self)
        
        profileData = resp.data?.user_data
        self.SideViewTable.reloadData()
    }
    
    func handleError(_ msg: String) {
        showError(msg, self: self)
    }
    
    
}
