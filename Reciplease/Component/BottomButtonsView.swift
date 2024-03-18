//
//  BottomButtonsView.swift
//  Reciplease
//
//  Created by MARTEAU Dylan on 16/01/2024.
//

import SwiftUI

struct BottomButtonsView: View {
    var body: some View {
        HStack {
            Button(action: {
                
            }) {
                Text("Search")
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding(.vertical, 26)
            .padding(.horizontal, 36)
            
            Button(action: {
                
            }) {
                Text("Favorite")
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.orange)
                    .cornerRadius(8)
            }
            .padding(.vertical, 26)
            .padding(.horizontal, 36)
        }
        .padding(.bottom, 16)
    }
}

#Preview {
    BottomButtonsView()
}
