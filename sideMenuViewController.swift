//
//  sideMenuViewController.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 10/11/22.
//

import UIKit

class sideMenuViewController: UIViewController {
    var menu  = false
    let screen = UIScreen.main.bounds
    var home  = CGAffineTransform()
    @IBOutlet weak var SideViewTable: UITableView!
    @IBOutlet weak var HomeView: UIView!
    @IBOutlet weak var upperView: UIView!
    
    let ProfilePicCellTableViewCell = "ProfilePicCellTableViewCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        home = self.HomeView.transform
        SideViewTable.delegate = self
        SideViewTable.dataSource = self
        SideViewTable.backgroundColor = .clear
//        assignBackgroundForView(view: HomeView)
//        assignBackground()
        
        let nibname = UINib(nibName: ProfilePicCellTableViewCell, bundle: nil)
        SideViewTable.register(nibname, forCellReuseIdentifier: ProfilePicCellTableViewCell)
        
    }


func showMenu() {
        
        self.HomeView.layer.cornerRadius = 40
        // self.viewBG.layer.cornerRadius = self.containerView.layer.cornerRadius
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
                // self.viewBG.layer.cornerRadius = 0
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
    
    
}


extension sideMenuViewController :  UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.menuNames.text = options[indexPath.row].title
        cell.menuNames.textColor = .white
        cell.backgroundColor = .black
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfilePicCellTableViewCell, for: indexPath) as! ProfilePicCellTableViewCell
            cell.backgroundColor = .clear
            return cell
        }else{
            return cell
        }
        
        
    }
    
    
}
