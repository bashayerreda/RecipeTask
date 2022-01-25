//
//  AllRecipesViewController.swift
//  RecipeTask
//
//  Created by bashayer reda on 1/21/22.
//  Copyright © 2022 bashayer reda. All rights reserved.
//

import UIKit

class AllRecipesViewController: UIViewController {
    
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
    historyArray =  defaults.stringArray(forKey: "h") ?? []
        self.goToHistory()
        self.FilterCollectionView.delegate = self
        self.FilterCollectionView.dataSource = self
        self.recipieTableView.delegate = self
        self.recipieTableView.dataSource = self
        
        
        allRecipeViewModel = AllRecipeViewModel()
        allRecipeViewModel.bindRecipeDataViewModelToView = {
            self.onSuccessUpdateView()
            
            
        }
        
    }
    
    
    
    
    
    
    
    
}
    

