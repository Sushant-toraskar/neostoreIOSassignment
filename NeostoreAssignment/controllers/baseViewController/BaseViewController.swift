//
//  BaseViewController.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 15/12/22.
//

import UIKit

class BaseViewController: UIViewController {
    let spinnerView = UIView()
    let sview = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinnerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        spinnerView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        spinnerView.center = view.center
        sview.color = .white
        sview.center = spinnerView.center
        spinnerView.addSubview(sview)
        view.addSubview(spinnerView)
        spinnerView.isHidden = true
    }
    
    
    func startLoader(){
        spinnerView.isHidden = false
        sview.startAnimating()
            }
    
    func stopLoader(){
        spinnerView.isHidden = true
        sview.stopAnimating()
    }
        
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
