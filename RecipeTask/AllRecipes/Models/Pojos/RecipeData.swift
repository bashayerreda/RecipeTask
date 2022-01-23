//
//  RecipeData.swift
//  RecipeTask
//
//  Created by bashayer reda on 1/21/22.
//  Copyright © 2022 bashayer reda. All rights reserved.
//

import Foundation
struct  RecipeData : Codable {
    var from , to ,count : Int
    var hits : [Recipe]?
    var _links : Link?
    
}
