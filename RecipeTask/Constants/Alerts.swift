//
//  Alerts.swift
//  RecipeTask
//
//  Created by bashayer reda on 1/25/22.
//  Copyright © 2022 bashayer reda . All rights reserved.
//

import Foundation
import UIKit
struct Alert {
    func showAlerts(title : String, message: String, vc : UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.destructive, handler: nil))
        vc.present(alert, animated: true, completion: nil)
        
        
    }
}
