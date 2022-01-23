//
//  HistoryTableViewExtension.swift
//  RecipeTask
//
//  Created by bashayer reda on 1/23/22.
//  Copyright © 2022 bashayer reda. All rights reserved.
//

import Foundation
import UIKit

extension HistoryTableViewController: UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        //show search history table when user clicks on search
        searchController.searchResultsController?.view.isHidden = false
    }
    
}
