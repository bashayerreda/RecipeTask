//
//  AllRecipeSearchBar.swift
//  RecipeTask
//
//  Created by bashayer reda on 1/22/22.
//  Copyright © 2022 bashayer reda. All rights reserved.
//

import Foundation
import UIKit
extension AllRecipesViewController : UISearchBarDelegate{
 
    func goToHistory(){
        let searchSuggestionsVC = storyboard!.instantiateViewController(withIdentifier: "History") as! HistoryTableViewController
                 //to display search results in location search table view
                 searchController = UISearchController(searchResultsController: searchSuggestionsVC)
        searchController?.searchResultsUpdater = searchSuggestionsVC
                 
        
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
        let SearchResult = searchBar.text!
        allRecipeViewModel.fetchDataFromNetworkClient(keyword: SearchResult)
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func onSuccessUpdateView(){
           recipes = allRecipeViewModel.recipeData.hits!
           self.recipieTableView.reloadData()
              
          }
  
    
}
