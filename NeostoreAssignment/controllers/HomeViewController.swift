//
//  HomeViewController.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 10/11/22.
//

import UIKit
import SideMenu

class HomeViewController: UIViewController {

    private var sideMenu = SideMenuNavigationController(rootViewController: sideMenucontrol())
    override func viewDidLoad() {
        super.viewDidLoad()
        assignBackground()
        sideMenu.leftSide = true
//        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: view)
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        let leftMenuNavigationController = SideMenuNavigationController(rootViewController: sideMenucontrol())
        SideMenuManager.default.leftMenuNavigationController = leftMenuNavigationController
        leftMenuNavigationController.statusBarEndAlpha = 0
    }
    
    
    @IBAction func handleClick(_ sender: Any) {
        present(sideMenu, animated: true)
    }
    
}

class sideMenucontrol: UIViewController {
    override func viewDidLoad() {
        print("sideMenu")
    }
    
    var labl = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    
}
