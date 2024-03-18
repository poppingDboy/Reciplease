//
//  FavoriteViewModel.swift
//  Reciplease
//
//  Created by MARTEAU Dylan on 14/02/2024.
//

import Foundation
import CoreData

class FavoriteViewModel: ObservableObject {
    @Published var favoriteList: [RecipeObject] = []
    private let repository = RecipeRepository()
    
    func addRecipeToFavorites(recipe: RecipeObject) {
        favoriteList.append(recipe)
        repository.saveRecipe(recipeObject: recipe)
        
//        if !favoriteList.contains(where: { $0.id == recipe.id }) {
//            favoriteList.append(recipe)
//            repository.saveRecipe(recipeObject: recipe)
//        }
    }
    
    func getRecipe() {
        print("FAVORITE VIEW MODEL ---- GET RECIPE")
        repository.getRecipes { [weak self] recipes in
            let mappedRecipes = recipes.map { recipeCore -> RecipeObject in
                return RecipeObject(
                    /*id: recipeCore.id,*/
                    title: recipeCore.title ?? "",
                    ingredients: recipeCore.ingredients as? [String] ?? [],
                    timeCook: Int(recipeCore.timeCook),
                    image: recipeCore.image ?? "",
                    urlDirection: recipeCore.urlDirection ?? ""
                )
            }
            
            DispatchQueue.main.async {
                self?.favoriteList = mappedRecipes
            }
        }
    }
}
    
    
    
        //        for favorite in favoriteList {
        //            print(favorite.title)
        //            print("ici :\(favorite)")
        //        }
        
        
        //        repository.savePerson(named: personName, completion: { [weak self] in
        //            people += personName + "\n"
        //            self?.peopleTextView.text = people
        //            self?.peopleTextField.text = ""
        //        })
    
    
//    func saveRecipe(recipeObject: RecipeObject) {
//        let recipe = RecipeCore(context: CoreDataStack.sharedInstance.viewContext)
//        recipe.title = recipeObject.title
//        recipe.ingredients = recipeObject.ingredients as NSObject
//        recipe.timeCook = Int64(recipeObject.timeCook)
//        recipe.image = recipeObject.image
//        recipe.urlDirection = recipeObject.urlDirection
//        
//        do {
//            try CoreDataStack.sharedInstance.viewContext.save()
//        } catch {
//            print("We were unable to save \(String(describing: recipe.title))")
//        }
//        
//    }
    
    
    
    //    func getRecipe() {
    //        repository.getRecipes(completion: { [weak self] recipes in
    //
    ////            let request = NSFetchRequest<RecipeCore> = RecipeCore.fetchRequest()
    //
    //            var recipeText = ""
    //            for recipe in recipes {
    //                if let title = recipe.title {
    //                    recipeText += title + "\n"
    //                }
    //            }
    //
    ////            self?.favoriteList = recipes
    //            // map
    //        })
    //    }
    
    
    //    // MARK: - Private
    //
    //    private func getRecipe() {
    //        repository.getPersons(completion: { [weak self] persons in
    //            var peopleText = ""
    //            for person in persons {
    //                if let name = person.name {
    //                    peopleText += name + "\n"
    //                }
    //            }
    //            self?.peopleTextView.text = peopleText
    //
    //
    //
    //        })
    //    }
    
    //    //////////            le mettre dans favoriteViewModel  getPeople()   et renommer la fonction en getRecipe()
    //    let request = NSFetchRequest<RecipeCore> = RecipeCore.fetchRequest()
    //    guard let recipes = try? CoreDataStack.sharedInstance.viewContext.fetch(request) else { return }
    //
    //    var recipeText = ""
    //    for recipe in recipes {
    //        if let title = recipe.title {
    //            recipeText += title + "\n"
    //        }
    //    }
    //
    //    peopleTextView.text = recipeText
    //
    
    
    

