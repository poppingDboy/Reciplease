//
//  RecipeObject.swift
//  Reciplease
//
//  Created by MARTEAU Dylan on 16/01/2024.
//

import Foundation

class RecipeObject: Identifiable, Hashable {
    var title: String
    var ingredients: [String]
    var numberLikes: Int
    var timeCook: Int
    
    init(title: String, ingredients: [String], numberLikes: Int, timeCook: Int) {
        self.title = title
        self.ingredients = ingredients
        self.numberLikes = numberLikes
        self.timeCook = timeCook
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: RecipeObject, rhs: RecipeObject) -> Bool {
        return lhs.id == rhs.id
    }
    
}
