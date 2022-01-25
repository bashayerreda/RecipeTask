//
//  AllRecipesViewController.swift
//  RecipeTask
//
//  Created by bashayer reda on 1/21/22.
//  Copyright © 2022 bashayer reda. All rights reserved.
//

import UIKit

class AllRecipesViewController: UIViewController {
    
    @IBOutlet weak var noResualtsLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var recipieTableView: UITableView!
    @IBOutlet weak var FilterCollectionView: UICollectionView!
    var searchController : UISearchController?
    var recipes : [Recipe] = [Recipe]()
    var recipeData : RecipeData!
    var allRecipeViewModel : AllRecipeViewModel!
    let defaults = UserDefaults.standard
    var historyArray : [String]!
    var SearchResult : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
        historyArray =  defaults.stringArray(forKey: "h") ?? []
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = .purple
        FilterCollectionView.allowsSelection = false
        
        self.goToHistory()
        self.FilterCollectionView.delegate = self
        self.FilterCollectionView.dataSource = self
        self.recipieTableView.delegate = self
        self.recipieTableView.dataSource = self
        
        
        allRecipeViewModel = AllRecipeViewModel()
        allRecipeViewModel.bindRecipeDataViewModelToView = {
            self.onSuccessUpdateView()
            
            
        }
        allRecipeViewModel.bindViewModelErrorToView = {
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
            self.onFailure()
        }
        allRecipeViewModel.bindNothingToView = {
            self.showEmptyResults()
        }
    }
    
    
    
    
    
    
    
    
}
    

