//
//  RecipeViewController_collectionView.swift
//  RecipeTask
//
//  Created by bashayer reda on 1/21/22.
//  Copyright © 2022 bashayer reda. All rights reserved.
//

import Foundation
import UIKit
extension AllRecipesViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FilterNames.filtersArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let filteredCell = collectionView.dequeueReusableCell(withReuseIdentifier: "filtercell", for: indexPath)
            as! FiltersCollectionViewCell
        filteredCell.filtersNamelabel.text = FilterNames.filtersArray[indexPath.row]
        return filteredCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            allRecipeViewModel.fetchDataFromNetworkClient(keyword:searchController!.searchBar.text!)
        case 1:
            allRecipeViewModel.fetchDataFromNetworkClientWithFilter(word:searchController!.searchBar.text!, healthFilterWords: FilterNames.filterArraysAPI[0])
        case 2:
            allRecipeViewModel.fetchDataFromNetworkClientWithFilter(word:searchController!.searchBar.text!, healthFilterWords: FilterNames.filterArraysAPI[1])
        case 3:
            allRecipeViewModel.fetchDataFromNetworkClientWithFilter(word:searchController!.searchBar.text!, healthFilterWords: FilterNames.filterArraysAPI[2])
        default:
            print("something error")
        }
    }
    
}
