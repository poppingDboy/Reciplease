//
//  MainView.swift
//  Reciplease
//
//  Created by MARTEAU Dylan on 19/12/2023.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = MainViewModel()
    @State var valueTextField: String
    @State private var showAlert = false
    
    var body: some View {
        //        NavigationStack {
        TabView {
            NavigationView {
                VStack {
                    VStack {
                        FridgeView(mainViewModel: viewModel)
                        
                        HStack(alignment: .center) {
                            TextField(Localized.Main.textValueTextField, text: $valueTextField)
                            Button(action: {
                                if viewModel.isValidInput(input: valueTextField) {
                                    viewModel.addIngredient(ingredient: valueTextField)
                                    valueTextField = ""
                                } else {
                                    showAlert = true
                                }
                            }) {
                                Text(Localized.Main.textAdd)
                                    .foregroundColor(.white)
                                    .padding(6)
                            }
                            .background(Color.green)
                            .cornerRadius(8)
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Attention"),
                                message: Text("Veuillez rentrer uniquement des lettres de l'alphabet, sans chiffres, espaces, ou caractères spéciaux."),
                                dismissButton: .default(Text("OK"))
                            )
                        }
                        .padding(.vertical, 20)
                        .padding(.horizontal, 30)
                        
                        IngredientsView(mainViewModel: viewModel)
                        
                        /// liste des ingredients
                        List(viewModel.ingredients, id: \.self) { ingredient in
                            HStack {
                                Text("- \(ingredient)")
                                Spacer()
                                Button(action: {
                                    /// Action pour supprimer l'élément
                                    viewModel.removeIngredient(ingredient: ingredient)
                                }) {
                                    Image(systemName: "xmark.circle")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                        .background(Color.gray)
                        .foregroundColor(.black)
                        
                        /// bouton vert search for recipes
                        NavigationLink(destination: ListRecipesView(mainViewModel: viewModel)) {
                            Text(Localized.Main.textSearch)
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color.green)
                                .cornerRadius(8)
                        }
                        .padding(.vertical, 10)
                        
                    }
                    
                    Spacer()
                }
            }
            .tabItem {
                Image(systemName: "book")
                Text("Recettes")
            }
            
            NavigationView {
                FavoriteView()
            }
            .tabItem {
                Image(systemName: "star.fill")
                Text("Favoris")
            }
            .navigationTitle(Localized.App.titleApp)
            
        }
        //        }
    }
}

#Preview {
    MainView(valueTextField: "")
}
