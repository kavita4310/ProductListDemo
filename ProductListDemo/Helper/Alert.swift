//
//  Alert.swift
//  ProductListDemo
//
//  Created by kavita chauhan on 20/07/24.
//

import Foundation
import UIKit


extension UIViewController{
    func displayAlert(title:String, msg:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        DispatchQueue.main.async{
            self.present(alert, animated: true)
        }
    }
}
