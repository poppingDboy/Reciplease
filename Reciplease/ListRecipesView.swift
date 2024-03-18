//
//  ListRecipesView.swift
//  Reciplease
//
//  Created by MARTEAU Dylan on 16/01/2024.
//

import SwiftUI

struct ListRecipesView: View {
    @StateObject private var viewModel = ListRecipesViewModel()
    var mainViewModel: MainViewModel
    
    init(mainViewModel: MainViewModel) {
        self.mainViewModel = mainViewModel
    }
    
    var body: some View {
//        TabView {
//            NavigationView {
            if self.mainViewModel.ingredients.isEmpty {
                    Text("Aucune recette trouvée")
                } else {
                    VStack {
                        List {
                            ForEach(viewModel.listRecipes, id: \.self) { recipe in
                                NavigationLink(destination: RecipeView(recipe: recipe)) {
                                    if let imageUrl = URL(string: recipe.image) {
                                        CardView(title: recipe.title, description: recipe.ingredients, backgroundImage: imageUrl, timeCook: recipe.timeCook)
                                            .padding(5)
                                    } else {
                                        CardViewWithoutImage(title: recipe.title, description: recipe.ingredients, timeCook: recipe.timeCook)
                                            .padding(5)
                                    }
                                }
                            }
                        }
                    }
                    .onAppear {
                        if viewModel.shouldFetchNewRecipes(for: mainViewModel.ingredients) {
                            viewModel.fetchRecipes(ingredients: mainViewModel.ingredients)
                        }
                    }
                    .navigationTitle("Recettes")
                }
//            }
//            .tabItem {
//                Image(systemName: "book")
//                Text("Recettes")
//            }
//            
//            FavoriteView()
//                .tabItem {
//                    Image(systemName: "star.fill")
//                    Text("Favoris")
//                }
//                .navigationTitle(Localized.App.titleApp)
        }
    }
//}

#Preview {
    ListRecipesView(mainViewModel: MainViewModel())
}
