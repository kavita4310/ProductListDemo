//
//  HomeVC.swift
//  ProductListDemo
//
//  Created by kavita chauhan on 13/06/24.
//

import UIKit
import GoogleSignIn

class HomeVC: UIViewController {

   
    @IBOutlet weak var productListTableVw: UITableView!
    let productModel = ProductViewModel()
    var productList:[ProductsDataModel] = []
    var window: UIWindow?

       override func viewDidLoad() {
           super.viewDidLoad()

           productListTableVw.delegate = self
           productListTableVw.dataSource = self
          
           // Check for local data
           if let localData = ApiHandler.shared.loadDataLocally() {
               self.productList = localData
               self.productListTableVw.reloadData()
           } else {
               callApi()
           }

           
           let nib = UINib(nibName: "ProductCell", bundle: nil)
           self.productListTableVw.register(nib, forCellReuseIdentifier: "ProductCell")
       }

    // MARK: Function Product API
       func callApi() {
           productModel.fetchProducts()
           productModel.productSuccess = { result in
               self.productList = result
               DispatchQueue.main.async {
                   self.productListTableVw.reloadData()

               }
           }
           productModel.productFailure = { error in
               self.displayAlert(title: "Alert", msg: error.localizedDescription)
           }       }
       
    
    @IBAction func btnLogout(_ sender: Any) {
        GIDSignIn.sharedInstance.signOut()
       UserDefaults.standard.removeObject(forKey: "ProductList")
        makeRootVC()
    }
    
    
    
    func makeRootVC(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "InitialVC")
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
    }
}


extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        cell.lblDescription.text = productList[indexPath.row].title
        let img = productList[indexPath.row].image
        cell.productImg.setImage(with: img)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
 
}
