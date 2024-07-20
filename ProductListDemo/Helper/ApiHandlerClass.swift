//
//  ApiHandlerClass.swift
//  ProductListDemo
//
//  Created by kavita chauhan on 13/06/24.
//

import Foundation
import Alamofire

class ApiHandler{
    
    static let shared = ApiHandler()

    typealias categoriesHandler = (Result<[ProductsDataModel], ErrorCondition>) -> Void

    
    //MARK: Product Api
    func getCategoriesApi(competion: @escaping categoriesHandler) {
        guard let url = URL(string: "https://fakestoreapi.com/products?") else {
            competion(.failure(.invalidUrl))
            return
        }

        AF.request(url, method: .get, encoding: JSONEncoding.default).response { response in
            switch response.result {
            case .success(let categoriesList):
                guard let categoriesList = categoriesList else {
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let jsondata = try decoder.decode([ProductsDataModel].self, from: categoriesList)
                    self.saveDataLocally(data: jsondata)
                    competion(.success(jsondata))
                } catch {
                    competion(.failure(.decodingError))
                }
                
            case .failure(let error):
                competion(.failure(.networkError(error)))
            }
        }
    }
    
    // Save data to UserDefaults
    private func saveDataLocally(data: [ProductsDataModel]) {
        if let encodedData = try? JSONEncoder().encode(data) {
            UserDefaults.standard.set(encodedData, forKey: "ProductList")
        }
    }

    // Load data from UserDefaults
    func loadDataLocally() -> [ProductsDataModel]? {
        if let savedData = UserDefaults.standard.data(forKey: "ProductList") {
            if let decodedData = try? JSONDecoder().decode([ProductsDataModel].self, from: savedData) {
                return decodedData
            }
        }
        return nil
    }

}


enum ErrorCondition: Error{
    
    case invalidUrl
    case invalidResponse
    case decodingError
    case networkError(Error?)
    
}
