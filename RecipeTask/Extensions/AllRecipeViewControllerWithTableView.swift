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
        return recipeCell!
     }
}
