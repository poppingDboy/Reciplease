//
//  FridgeView.swift
//  Reciplease
//
//  Created by MARTEAU Dylan on 29/01/2024.
//

import SwiftUI

struct FridgeView: View {
    var mainViewModel: MainViewModel
    
    init(mainViewModel: MainViewModel) {
        self.mainViewModel = mainViewModel
    }
    
    var body: some View {
        VStack {
            Text(Localized.Main.fridgeTitle)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .padding(.vertical, 6)
                .padding(.horizontal, 0)
            
        }
    }
}

#Preview {
    FridgeView(mainViewModel: MainViewModel())
}
