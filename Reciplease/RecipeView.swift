//
//  RecipeView.swift
//  Reciplease
//
//  Created by MARTEAU Dylan on 09/01/2024.
//

import SwiftUI

struct RecipeView: View {
    @State private var isStarred = false
    @Environment(\.openURL) var openURL
    var recipe: RecipeObject
    @EnvironmentObject var favoriteViewModel: FavoriteViewModel
    
    init(recipe: RecipeObject) {
        self.recipe = recipe
    }
    
    var body: some View {
        VStack {
            if let imageUrl = URL(string: recipe.image) {
                CardView(title: recipe.title, description: recipe.ingredients, backgroundImage: imageUrl, timeCook: recipe.timeCook)
                    .padding(5)
            } else {
                CardViewWithoutImage(title: recipe.title, description: recipe.ingredients, timeCook: recipe.timeCook)
                    .padding(5)
            }
            
            Text(recipe.title)
                .font(.title)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .background(Color.gray)
            
            List {
                Section(header: Text("Ingredients")) {
                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                        Text("- \(ingredient)")
                    }
                }
            }
            
            Button(action: {
                if let url = URL(string: recipe.urlDirection) {
                    openURL(url)
                }
            }) {
                Text(Localized.Recipe.textGetDirections)
                    .foregroundColor(.white)
                    .padding(6)
            }
            .padding(2)
            .background(Color.green)
            .cornerRadius(8)
            
            Spacer()
        }
        .navigationBarItems(
            trailing: Button(action: {
                print("is starred :\(isStarred)")
                isStarred.toggle()
                if isStarred {
                    favoriteViewModel.addRecipeToFavorites(recipe: recipe)
                    print("is starred after :\(isStarred)")
                }
            }) {
                Image(systemName: isStarred ? "star.fill" : "star")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .padding()
            }
                .foregroundColor(.yellow)
        )
    }
    
}


#Preview {
    RecipeView(recipe: RecipeObject(title: "", ingredients: [""], timeCook: 1, image: "", urlDirection: ""))
}

