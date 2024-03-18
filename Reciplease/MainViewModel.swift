//
//  MainViewModel.swift
//  Reciplease
//
//  Created by MARTEAU Dylan on 09/01/2024.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var ingredients: [String] = []
    
    func addIngredient(ingredient: String) {
        ingredients.append(ingredient)
    }
    
    func removeIngredient(ingredient: String) {
        ingredients.removeAll { $0 == ingredient }
    }
    
    func removeAllIngredients() {
        ingredients.removeAll()
    }
    
    func isValidInput(input: String) -> Bool {
        let regex = "^[a-zA-Z]+$"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
        return predicate.evaluate(with: input)
    }
    
}
