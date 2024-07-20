//
//  ProductModel.swift
//  ProductListDemo
//
//  Created by kavita chauhan on 20/07/24.
//

import Foundation

struct ProductsDataModel:Codable{
    var id:Int
    var title:String
    var price:Float
    var description:String
    var category:String
    var image:String
    var rating:Ratings
    
}
struct Ratings:Codable {
    var rate:Float
    var count:Int
}




