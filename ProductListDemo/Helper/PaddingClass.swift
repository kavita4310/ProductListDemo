//
//  PaddingClass.swift
//  ProductListDemo
//
//  Created by kavita chauhan on 13/06/24.
//

import Foundation
import UIKit
import Kingfisher


extension UITextField {

    func setLeftPadding(_ amount: CGFloat = 10) {

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.bounds.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }

    func setRightPadding(_ amount: CGFloat = 10) {

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.bounds.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}


extension UIImageView{
    func setImage(with urlString:String){
        guard let url = URL.init(string: urlString)else {return}
        let resource = KF.ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with:resource)
                             
    }
}
