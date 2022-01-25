//
//  DetailsViewController.swift
//  RecipeTask
//
//  Created by bashayer reda on 1/23/22.
//  Copyright © 2022 bashayer reda. All rights reserved.
//

import UIKit
import SafariServices
class DetailsViewController: UIViewController {
    
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeIngredientsTable: UITableView!
    @IBOutlet weak var recipeImage: UIImageView!
    var recipeData : RecipeDetails!
    var ingredients : [String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self,action: #selector(share(sender:)))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.purple
        
        self.recipeIngredientsTable.delegate = self
        self.recipeIngredientsTable.dataSource = self
        
        guard recipeData.image != nil && recipeData.label != nil && recipeData.ingredientLines != nil
            
            else{
                return
        }
        
        recipeImage.sd_setImage(with: URL(string: recipeData.image!))
        recipeName.text = recipeData.label!
        ingredients = recipeData.ingredientLines!
        
    }
    
    @IBAction func goToSafari(_ sender: Any) {
        if let url = URL(string: recipeData.url!) {
    let config = SFSafariViewController.Configuration()
    config.entersReaderIfAvailable = true

    let vc = SFSafariViewController(url: url, configuration: config)
    present(vc, animated: true)
        }
        
    }
   
    //share recipe Link only
    /*@objc  func share(sender:UIView){
     let items = [URL(string: recipeData.url!)]
     let ac = UIActivityViewController(activityItems: items as [Any], applicationActivities: nil)
     present(ac, animated: true)
     }*/
    
    //share recipe link and print it too
    @objc func share(sender:UIView){
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let textToShare =  URL(string: recipeData.url!)
        let objectsToShare = [textToShare!, image ?? #imageLiteral(resourceName: "app-logo")] as [Any]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        
        
        //Excluded Activities
        activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
        //
        
        activityVC.popoverPresentationController?.sourceView = sender
        self.present(activityVC, animated: true, completion: nil)
    }    }

