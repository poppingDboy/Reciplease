//
//  FavoriteView.swift
//  Reciplease
//
//  Created by MARTEAU Dylan on 23/01/2024.
//

import SwiftUI

struct FavoriteView: View {
    @ObservedObject var viewModel = FavoriteViewModel()
    private let recipeRepository = RecipeRepository()
    private var people: [RecipeCore] = []
    
    var body: some View {
        TabView {
            NavigationView {
                if viewModel.favoriteList.isEmpty {
                    Text("Aucune recette trouvée")
                } else {
                    VStack {
                        List {
                            ForEach(viewModel.favoriteList, id: \.self) { favorite in
                                NavigationLink(destination: RecipeView(recipe: favorite)) {
                                    
                                    
                                    
                                    if let imageUrl = URL(string: favorite.image) {
                                        CardView(title: favorite.title, description: favorite.ingredients, backgroundImage: imageUrl, timeCook: favorite.timeCook)
                                            .padding(5)
                                    } else {
                                        CardViewWithoutImage(title: favorite.title, description: favorite.ingredients, timeCook: favorite.timeCook)
                                            .padding(5)
                                    }
                                }
                            }
                        }
                    }
                    .onAppear {
                        viewModel.getRecipe()
                        print("FAVORITE VIEW --- ON APPEAR ")
                    }
                    .navigationTitle("Recettes")
                }
            }
        }
    }
}

//// MARK: - View life cycle
//
//   override func viewWillAppear(_ animated: Bool) {
//     super.viewWillAppear(animated)
//     getPersons()
//   }
//
//   private func getPersons() {
//     peopleRepository.getPersons(completion: { [weak self] people in
//       self?.people = people
//       self?.personPickerView.reloadAllComponents()
//     })
//   }

#Preview {
    FavoriteView()
}

/// Pour récuperer les données de la bdd CoreData
///
//override func viewDidLoad() {
//    super.viewDidLoad()
//      getPeople()
//  }


////////////            le mettre dans favoriteViewModel  getPeople()   et renommer la fonction en getRecipe()
//    let request = NSFetchRequest<RecipeCore> = RecipeCore.fetchRequest()
//    guard let recipes = try? CoreDataStack.sharedInstance.viewContext.fetch(request) else { return }
//
//      var recipeText = ""
//      for recipe in recipes {
//          if let title = recipe.title {
//              recipeText += title + "\n"
//          }
//      }
//
//      peopleTextView.text = recipeText  -> ->  remplacer peopleTextView par l'objet UI sur l'application .. liste , tab par exemple
//}
