//
//  ViewController.swift
//  ProductListDemo
//
//  Created by kavita chauhan on 13/06/24.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }
    

    //MARK: Login Button
    @IBAction func btnLogin(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    @IBAction func btnRegister(_ sender: Any) {
    }
    
    

}

