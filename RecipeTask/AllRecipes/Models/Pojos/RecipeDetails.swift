//
//  RecipeDetails.swift
//  RecipeTask
//
//  Created by bashayer reda on 1/21/22.
//  Copyright © 2022 bashayer reda. All rights reserved.
//

import Foundation
struct RecipeDetails :Codable {
    var healthLabels ,ingredientLines : [String]?
    var label , image , source , url : String?
  
   
}
