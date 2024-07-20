//
//  LoginVC.swift
//  ProductListDemo
//
//  Created by kavita chauhan on 13/06/24.
//

import UIKit
import GoogleSignIn

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var txtUserNameorEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtPassword.setLeftPadding(20)
        txtUserNameorEmail.setLeftPadding(20)
    }
    
    //MARK: Button login
    @IBAction func btnLogin(_ sender: Any) {
      
        if !txtUserNameorEmail.text!.isEmpty && !txtPassword.text!.isEmpty {
            signIn()
        }else{
            print("required all feilds")
        }
        
    }
    
    func signIn() {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { user, error in
            if let error = error {

                self.displayAlert(message: error.localizedDescription)
                return
            }
            print( user?.user.profile?.email ?? "")
            print( user?.user.userID ?? "")

            self.displayAlert(title: "Message", message: "Successfully SignIn"){
                let vc = self.storyboard?.instantiateViewController(identifier: "HomeVC") as! HomeVC
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }

    
   
    //MARK: Button Google
    @IBAction func btnGoogle(_ sender: Any) {
    signIn()
   
    }
    
    //MARK: Button Facebook
    @IBAction func btnFacebook(_ sender: Any) {
        
        if let url = URL(string: "https://www.facebook.com/") {
            if UIApplication.shared.canOpenURL(url) {
                // Open the URL
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                print("Cannot open URL")
            }
        }
    }
    

    
    @IBAction func btnInstagram(_ sender: Any) {
    }
    
  
    @IBAction func btnLinkdin(_ sender: Any) {
    }
    
    
}
//MARK: Alert
extension UIViewController {
    
    func displayAlert(title: String = "Alert", message: String, okAction: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAlertAction = UIAlertAction(title: "OK", style: .default) { _ in
            okAction?()
        }
        
        alertController.addAction(okAlertAction)
        
        present(alertController, animated: true, completion: nil)
    }
}


