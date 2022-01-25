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
        searchController!.searchBar.text = SearchResult
        allRecipeViewModel.fetchDataFromNetworkClient(keyword: SearchResult!)
        self.recipieTableView.reloadData()
     
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
        UIBarButtonItem.appearance(whenContainedInInstancesOf:[UISearchBar.self]).tintColor = UIColor.purple
        
        
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard addRestrictions(keyWord: searchBar.text!) != false
            else{
                
                searchBar.text = ""
                FilterCollectionView.allowsSelection = false
                return
        }
        
        if (searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines))?.isEmpty == true{
            
            Alert().showAlerts(title: "invalid Inputs", message: "Empty spaces not allowed", vc: self)
            searchBar.text = ""
            FilterCollectionView.allowsSelection = false
        }
            
        else
        {   SearchResult = searchBar.text!
            noResualtsLabel.isHidden = true
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
            self.recipieTableView.reloadData()
            allRecipeViewModel.fetchDataFromNetworkClient(keyword: SearchResult!)
            dismiss(animated: true, completion: nil)
            
        }
        
        
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        recipieTableView.isHidden = true
        noResualtsLabel.isEnabled = true
        noResualtsLabel.isHidden = false
        FilterCollectionView.allowsSelection = false
    }
    
    func onSuccessUpdateView(){
        FilterCollectionView.allowsSelection = true
        let trimmedKeyword =  SearchResult?.trimmingCharacters(in: .whitespaces)
        if  historyArray.contains(trimmedKeyword!){
            let selectedIndex =   historyArray!.firstIndex(of: trimmedKeyword!)
            historyArray?.remove(at: selectedIndex!)
        }
        historyArray.append(SearchResult!)
        defaults.set(historyArray, forKey: "h")
        noResualtsLabel.isHidden = true
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
        recipieTableView.isHidden = false
        recipes = allRecipeViewModel.recipeData.hits!
        self.recipieTableView.reloadData()
        
    }
    
    func onFailure(){
        noResualtsLabel.isHidden = false
        activityIndicator.stopAnimating()
        Alert().showAlerts(title: "error", message: allRecipeViewModel.showError, vc: self)
    }
    
    func showEmptyResults(){
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
        noResualtsLabel.isEnabled = true
        recipieTableView.isHidden = true
    }
    
    
    func addRestrictions(keyWord : String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z0-9 ].*", options: [])
            if regex.firstMatch(in:keyWord, options: [], range: NSMakeRange(0, keyWord.count)) != nil {
                Alert().showAlerts(title: "invalid Inputs", message: "Only english letters are allowed and spaces not allowed", vc: self)
                return false
            }
        }
        catch {
            print("something went wrong")
        }
        return true
    }
}


