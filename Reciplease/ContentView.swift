//
//  ContentView.swift
//  Reciplease
//
//  Created by MARTEAU Dylan on 19/12/2023.
//

import SwiftUI

struct ContentView: View {
    var favoriteViewModel = FavoriteViewModel()
    
    var body: some View {
        MainView(valueTextField: "")
            .environmentObject(MainViewModel())
            .environmentObject(favoriteViewModel)
        
    }
}

#Preview {
    ContentView()
}
