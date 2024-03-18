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
    var timeCook: Int
    var image: String
    var urlDirection: String
    
    init(title: String, ingredients: [String], timeCook: Int, image: String, urlDirection: String) {
        self.title = title
        self.ingredients = ingredients
        self.timeCook = timeCook
        self.image = image
        self.urlDirection = urlDirection
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: RecipeObject, rhs: RecipeObject) -> Bool {
        return lhs.id == rhs.id
    }
    
}
