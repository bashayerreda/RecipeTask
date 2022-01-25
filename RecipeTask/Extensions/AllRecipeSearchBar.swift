//
//  AllRecipeSearchBar.swift
//  RecipeTask
//
//  Created by bashayer reda on 1/22/22.
//  Copyright © 2022 bashayer reda. All rights reserved.
//

import Foundation
import UIKit
extension AllRecipesViewController : UISearchBarDelegate ,SuggestionRecipeSelected{
    
    func suggestionSelected(keyword: String) {
        let selectedIndex =  historyArray!.firstIndex(of: keyword)
       historyArray?.remove(at: selectedIndex!)
        SearchResult = keyword
        allRecipeViewModel.fetchDataFromNetworkClient(keyword: SearchResult!)
        dismiss(animated: true, completion: nil)
    }
    
 
    func goToHistory(){
        
        let searchSuggestionsVC = storyboard!.instantiateViewController(withIdentifier: "History") as! HistoryTableViewController
                 //to display search results in location search table view
                 searchController = UISearchController(searchResultsController: searchSuggestionsVC)
        searchController?.searchResultsUpdater = searchSuggestionsVC
        searchSuggestionsVC.suggestionDelegate = self
        
                 //configures the search bar, and embeds it within the navigation bar
                 let searchBar = searchController?.searchBar
                 searchBar?.placeholder = "Search for recipe name"
                 searchController?.hidesNavigationBarDuringPresentation = false
                 searchController?.searchBar.delegate = self
                 
                 navigationItem.hidesSearchBarWhenScrolling = false
                 navigationItem.titleView = searchBar
                 definesPresentationContext = true
                 
                 //change cancel button color
                 UIBarButtonItem.appearance(whenContainedInInstancesOf:[UISearchBar.self]).tintColor = UIColor.black
        
        
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
         SearchResult = searchBar.text!
        allRecipeViewModel.fetchDataFromNetworkClient(keyword: SearchResult!)
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func onSuccessUpdateView(){
     
let trimmedKeyword =  SearchResult?.trimmingCharacters(in: .whitespaces)
            if  historyArray.contains(trimmedKeyword!){
let selectedIndex =   historyArray!.firstIndex(of: trimmedKeyword!)
                    historyArray?.remove(at: selectedIndex!)
        }
        historyArray.append(SearchResult!)
       defaults.set(historyArray, forKey: "h")
           recipes = allRecipeViewModel.recipeData.hits!
           self.recipieTableView.reloadData()
              
          }
  
    
}
