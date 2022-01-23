//
//  RecipeSearchViewModel.swift
//  RecipeTask
//
//  Created by bashayer reda on 1/21/22.
//  Copyright © 2022 bashayer reda. All rights reserved.
//

import Foundation
class AllRecipeViewModel : NSObject{
    var networkClient : NetworkClient!
    override init() {
           super .init()
           self.networkClient = NetworkClient()
       }
    var showError : String!{
        didSet{
            self.bindViewModelErrorToView()
        }
    }
    var recipeData : RecipeData!{
        didSet{
            self.bindRecipeDataViewModelToView()
        }
    }
   
var bindRecipeDataViewModelToView : (()->()) = {}
var bindViewModelErrorToView:(()->())={}
var bindNothingToView : (()->())={}
    func fetchDataFromNetworkClient(keyword : String)  {
        networkClient.fetchDataUsingSearchWords(keyword: keyword) { (results, error) in
    if let error = error{
        let message = error.localizedDescription
        print(message)
        self.showError = message
    }
    else if results?.hits?.count != 0{
        self.recipeData = results
                        
    }
    else {
        self.bindNothingToView()
            }
                
        }
        
        
    }
    func fetchDataFromNetworkClientWithFilter(word : String,healthFilterWords : String)  {
          networkClient.fetchDataUsingSearchAndFilterLabels(keyword: word, healthFilters: healthFilterWords) { (results, error) in
          if let error = error{
              let message = error.localizedDescription
              print(message)
              self.showError = message
          }
          else if results?.hits?.count != 0{
              self.recipeData = results
                              
          }
          else {
              self.bindNothingToView()
                  }
                      
              }
              
              
          }
    func fetchNextPageDataFromNetworkClient(NextPage : String)  {
        networkClient.getDataFromNextPage(nextPage: NextPage)
        { (results, error) in
        if let error = error{
            let message = error.localizedDescription
            print(message)
            self.showError = message
        }
        else if results?.hits?.count != 0{
            self.recipeData = results
                            
        }
        else {
            self.bindNothingToView()
                }
                    
            }
            
            
        
    }
}
