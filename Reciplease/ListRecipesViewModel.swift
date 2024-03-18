//
//  ListRecipesViewModel.swift
//  Reciplease
//
//  Created by MARTEAU Dylan on 16/01/2024.
//

import Foundation
import SwiftUI
import Alamofire

class ListRecipesViewModel: ObservableObject {
    
    @Published var listRecipes: [RecipeObject] = []
    @Published var errorRecipes: Error?
    private var lastFetchedIngredients: [String] = []
    
    let edamamRepository = EdamamRepository(session: URLSession(configuration: .default))
    
    @Published var noResultsFound = false
    
    func addRecipe(title: String, ingredients: [String], timeCook: Int, image: String, urlDirection: String) {
        let newRecipe = RecipeObject(title: title, ingredients: ingredients, timeCook: timeCook, image: image, urlDirection: urlDirection)
        listRecipes.append(newRecipe)
    }
    
    func shouldFetchNewRecipes(for ingredients: [String]) -> Bool {
        let isDifferent = Set(ingredients) != Set(lastFetchedIngredients)
        if isDifferent {
            lastFetchedIngredients = ingredients
        }
        return isDifferent
    }
    
    func fetchRecipes(ingredients: [String]) {
        noResultsFound = false
        
        edamamRepository.getRecipesRepo(for: ingredients) { [weak self] success, response in
            guard let self = self else {
                return
            }
            
            guard let response = response else {
                self.errorRecipes = NSError(domain: "ListRecipesViewModelErrorDomain", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to get response data."])
                return
            }
            
            if success {
                self.errorRecipes = nil
                self.listRecipes = response.hits.map { hit in
                    let limitedIngredients = hit.recipe.ingredients.map { $0.text }.prefix(4)
                    return RecipeObject(title: hit.recipe.label,
                                        ingredients: Array(limitedIngredients),
                                        timeCook: hit.recipe.totalTime,
                                        image: hit.recipe.image,
                                        urlDirection: hit.recipe.url)
                }
                noResultsFound = false
            } else {
                self.errorRecipes = NSError(domain: "ListRecipesErrorDomain", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch recipes data."])
                noResultsFound = true
            }
            
        }
    }
    
    
    //    func saveRecipe(name: String) {
    //        let recipe  = RecipeCore(context: CoreDataStack.sharedInstance.viewContext)
    //        recipe.name = name
    //        do {
    //            try CoreDataStack.sharedInstance.viewContext.save()
    //        } catch {
    //            print("We ere unable to save \(recipe.name)")
    //        }
    //    }
    
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //        let request: NSFetchRequest<Recipe> = Recipe.fetchRequest()
    //        guard let recipes = try? CoreDataStack.sharedInstance.viewContext.fetch(request) else { return }
    //        var recipeText = ""
    //        for recipe in recipes {
    //            if let name = recipe.name {
    //                recipeText += name + "\n"
    //            }
    //        }
    //        // la ligne qui sert à afficher les noms
    //        // peopleTextView.text = recipeText
    //    }
    
}
