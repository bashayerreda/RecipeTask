//
//  DetailsTableViewEx.swift
//  RecipeTask
//
//  Created by bashayer reda on 1/23/22.
//  Copyright © 2022 bashayer reda. All rights reserved.
//

import Foundation
import UIKit
extension DetailsViewController : UITableViewDelegate , UITableViewDataSource{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
let detailsCell = tableView.dequeueReusableCell(withIdentifier: "ingredientsCell", for: indexPath)
        detailsCell.textLabel!.text = ingredients[indexPath.row]
        return detailsCell
    }
    
    
}
