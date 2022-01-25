//
//  AllRecipeViewControllerWithTableView.swift
//  RecipeTask
//
//  Created by bashayer reda on 1/21/22.
//  Copyright © 2022 bashayer reda. All rights reserved.
//

import Foundation
import UIKit
extension AllRecipesViewController : UITableViewDelegate,UITableViewDataSource{
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let recipeCell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as? RecipeTableViewCell
                 
        recipeCell?.recipeTitle.text = recipes[indexPath.row].recipe?.label ?? ""
        recipeCell?.recipeSource.text = recipes[indexPath.row].recipe?.source ?? ""
        if let recipeImage = recipes[indexPath.row].recipe!.image{
                  recipeCell?.recipeImage.sd_setImage(with: URL(string: recipeImage))
               }
        var healthLabels: String = ""
        if let healthArray = recipes[indexPath.row].recipe!.healthLabels{
                   for label in healthArray{
                       healthLabels.append("\(label),")
                   }
                recipeCell?.recipeHealthLabel.text = healthLabels
               }
        return recipeCell!
     }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
      if indexPath.section == tableView.numberOfSections - 1 &&
indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
           
               
        if let next = allRecipeViewModel.recipeData._links?.next{
        let nextPage = next.href
        allRecipeViewModel.fetchNextPageDataFromNetworkClient(NextPage: nextPage!)
        
             
        
        }
     
    }
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     let DetailsVc = self.storyboard?.instantiateViewController(withIdentifier: "Details") as! DetailsViewController
        DetailsVc.recipeData = recipes[indexPath.row].recipe
            print(recipes)
    self.navigationController?.pushViewController(DetailsVc, animated: true)
       
    }
 
             
}
 


