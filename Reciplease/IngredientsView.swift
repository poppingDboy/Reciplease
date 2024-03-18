//
//  IngredientsView.swift
//  Reciplease
//
//  Created by MARTEAU Dylan on 29/01/2024.
//

import SwiftUI

struct IngredientsView: View {
    var mainViewModel: MainViewModel
    
    init(mainViewModel: MainViewModel) {
        self.mainViewModel = mainViewModel
    }
    
    var body: some View {
        VStack {
            /// Your ingredients
            HStack {
                Text(Localized.Main.textIngredient)
                Spacer()
                Button(action: {
                    mainViewModel.removeAllIngredients()
                }) {
                    Text(Localized.Main.textClear)
                        .foregroundColor(.white)
                        .padding(6)
                }
                .background(Color.red)
                .cornerRadius(8)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 30)
            
        }
        .background(Color.gray)
        .foregroundColor(.white)
        .alignmentGuide(.leading) { _ in 0 }
    }
}

#Preview {
    IngredientsView(mainViewModel: MainViewModel())
}
