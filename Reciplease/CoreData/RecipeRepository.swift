//
//  RecipeRepository.swift
//  Reciplease
//
//  Created by MARTEAU Dylan on 26/02/2024.
//

import Foundation
import CoreData

final class RecipeRepository {
    
    // MARK: - Properties
    
    private let coreDataStack: CoreDataStack
    
    // MARK: - Init
    
    init(coreDataStack: CoreDataStack = CoreDataStack.sharedInstance) {
        self.coreDataStack = coreDataStack
    }
    
    // MARK: - Repository
    
    func getRecipes(completion: ([RecipeCore]) -> Void) {
        let request: NSFetchRequest<RecipeCore> = RecipeCore.fetchRequest()
        
        do {
            let recipes = try coreDataStack.viewContext.fetch(request)
            completion(recipes)
        } catch {
            completion([])
        }
    }
    
   
    func saveRecipe(recipeObject: RecipeObject, completion: (() -> Void)? = nil) {
        let recipe = RecipeCore(context: coreDataStack.viewContext)
        recipe.title = recipeObject.title
        recipe.ingredients = recipeObject.ingredients.joined(separator: ",")
        recipe.timeCook = Int64(recipeObject.timeCook)
        recipe.image = recipeObject.image
        recipe.urlDirection = recipeObject.urlDirection
        do {
            try coreDataStack.viewContext.save()
            completion?()
        } catch {
            print("We were unable to save \(String(describing: recipe.title))")
        }
    }
    
    
}
