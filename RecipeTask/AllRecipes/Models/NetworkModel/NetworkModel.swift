//
//  NetworkModel.swift
//  RecipeTask
//
//  Created by bashayer reda on 1/21/22.
//  Copyright © 2022 bashayer reda. All rights reserved.
//

import Foundation
import Alamofire
import SDWebImage
class NetworkClient  {
    func fetchDataUsingSearchWords(keyword:String,completion : @escaping (RecipeData?, Error?)->()){
        let serachParameters : [String : Any] = [
            "q" : keyword,
            "app_key" : ApiConstants.app_key ,
            "app_id" : ApiConstants.app_id
        ]
        AF.request(ApiConstants.url, parameters: serachParameters )
            .validate()
            .responseDecodable(of: RecipeData.self) { (response) in
                switch response.result {
                    
                case .success( _):
                    
                    guard let recipeDataResults = response.value else { return }
                    
                    completion(recipeDataResults,nil)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(nil, error)
                    
                }
        }
    }
    func fetchDataUsingSearchAndFilterLabels(keyword : String ,healthFilters: String ,completion : @escaping (RecipeData?, Error?)->()){
        let filtersparams : [String : Any] = [
            "q" : keyword,
            "app_id" : ApiConstants.app_id,
            "app_key" : ApiConstants.app_key,
            "health" : healthFilters
        ]
        AF.request(ApiConstants.url, parameters: filtersparams)
            .validate()
            .responseDecodable(of: RecipeData.self) { (response) in
                switch response.result {
                    
                case .success( _):
                    
                    guard let recipeDataResults = response.value else { return }
                    
                    completion(recipeDataResults,nil)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(nil, error)
                    
                }
                
        }
    }
    func getDataFromNextPage(nextPage : String,completion :@escaping (RecipeData?, Error?)->()){
        AF.request(nextPage)
            .validate()
            .responseDecodable(of: RecipeData.self) { (response) in
                switch response.result {
                    
                case .success( _):
                    
                    guard let recipeDataResults = response.value else { return }
                    
                    completion(recipeDataResults,nil)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(nil, error)
                    
                }
        }
    }
}
