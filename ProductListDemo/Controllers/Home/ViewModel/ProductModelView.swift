//
//  ProductModelView.swift
//  ProductListDemo
//
//  Created by kavita chauhan on 20/07/24.
//

import Foundation

final class ProductViewModel{
    
    var productSuccess: (([ProductsDataModel]) -> Void)?
    var productFailure: ((Error) -> Void)?// data binding through closure
    func fetchProducts(){
        ApiHandler.shared.getCategoriesApi { response in
            switch response{
            case.success(let product):
                self.productSuccess?(product)
                
            case.failure(let error):
                self.productFailure?(error)
                
            }
        }
    }
}
