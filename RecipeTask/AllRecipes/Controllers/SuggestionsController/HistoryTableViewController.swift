//
//  HistoryTableViewController.swift
//  RecipeTask
//
//  Created by bashayer reda on 1/22/22.
//  Copyright © 2022 bashayer reda. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {
    var searchHistoryArray : [String]!
    var suggestionDelegate : SuggestionRecipeSelected!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        searchHistoryArray = UserDefaults.standard.stringArray(forKey: "h")?.suffix(10) ?? []
        
        searchHistoryArray.reverse()
        self.tableView.reloadData()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return searchHistoryArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = searchHistoryArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        suggestionDelegate.suggestionSelected(keyword:searchHistoryArray[indexPath.row])
        dismiss(animated: true, completion: nil)
        
    }
    

}
