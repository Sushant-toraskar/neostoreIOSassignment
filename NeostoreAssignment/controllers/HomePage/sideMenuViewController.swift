import UIKit

//protocol handleParameterPassing {
//    func passparameter(_ params : [String : Int],_ prodName : String)
//}


class sideMenuViewController: BaseViewController {
    var menu  = false
    let screen = UIScreen.main.bounds
    var home  = CGAffineTransform()
//    var profileData : LoginData?
    var sb = UIStoryboard(name: "Main", bundle: nil)
    var vm = HomeViewModel()
    var profileVM = LoginViewModel()
    var vc = ProductListViewController()
    var profileData : Any?

    
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
    
    override func viewWillAppear(_ animated: Bool) {
        //navigate back and use that data to show here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        vm.delegate = self
        
//        vm.returnData()
        profileData = profileVM.profileData
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

            if let fname = profileVM.profileData?.first_name, let lname = profileVM.profileData?.last_name,let mail = profileVM.profileData?.email{
                cell.UserName.text = "\(fname) \(lname)"
                cell.UserMail.text = "\(mail)"
                cell.profilePic.downloaded(from: profileVM.profileData?.profile_pic ?? "", contentMode: .scaleAspectFit)

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
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        switch indexPath.row {
        case 1:
            let nextVC = (storyboard?.instantiateViewController(identifier: "CartViewController"))!
            self.navigationController?.pushViewController(nextVC, animated: true)
            
        case 2:
            let nextVC = (storyboard?.instantiateViewController(identifier: "CartViewController"))!
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 3:
            let nextVC = (storyboard?.instantiateViewController(identifier: "CartViewController"))!
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 4:
            let nextVC = (storyboard?.instantiateViewController(identifier: "CartViewController"))!
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 5:
            let nextVC = (storyboard?.instantiateViewController(identifier: "CartViewController"))!
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 6:
            let nextVC = storyboard?.instantiateViewController(identifier: "MyAccountViewController") as! MyAccountViewController
            nextVC.vm = vm
            
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 7:
            let nextVC = (storyboard?.instantiateViewController(identifier: "CartViewController"))!
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 8:
            let nextVC = (storyboard?.instantiateViewController(identifier: "OrdersViewController"))!
            self.navigationController?.pushViewController(nextVC, animated: true)
        default:
            let nextVC = (storyboard?.instantiateViewController(identifier: "CartViewController"))!
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        
//        if indexPath.row == 1{
//            let nextVC = (storyboard?.instantiateViewController(identifier: "CartViewController"))!
//            self.navigationController?.pushViewController(nextVC, animated: true)
//        }indexPath.row == 6{
//
//        }

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


            print("prod img",productTypeImgList[indexPath.row])
            productTypeCell.productListImg.image = productTypeImgList[indexPath.row]
            


            
            return productTypeCell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell, for: indexPath) as! CollectionViewCell
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("cell")
        print("index",indexPath)
        //        let nextvc = ProductListViewController.loadNib(id: 1, Title: "Chair")
        if collectionView == ProductTypesCollection{
            let nextvc : UIViewController?
            switch indexPath.row{
            case 0:
                nextvc = ProductListViewController.loadNib(id: 1, Title: "Tables")
            case 1:
                nextvc = ProductListViewController.loadNib(id: 3, Title: "Sofas")
            case 2:
                nextvc = ProductListViewController.loadNib(id: 2, Title: "Chairs")
            case 3:
                nextvc = ProductListViewController.loadNib(id: 4, Title: "Beds")
            default:
                nextvc = ProductListViewController.loadNib(id: 1, Title: "Chair")
            }
            guard let vc = nextvc else{
                return
            }
            self.navigationController?.pushViewController(vc, animated: true)

            
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

