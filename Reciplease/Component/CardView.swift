//
//  CardView.swift
//  Reciplease
//
//  Created by MARTEAU Dylan on 03/01/2024.
//

import SwiftUI

struct CardView: View {
    var title: String = "Titre de la Cartouche"
    var description: String = "Description de la Cartouche. Cela peut être une explication détaillée."
    var backgroundImage: Image = Image("crepe")
    
    init(title: String, description: String, backgroundImage: Image) {
        self.title = title
        self.description = description
        self.backgroundImage = backgroundImage
    }
    
    var body: some View {
        ZStack {
            backgroundImage
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 8) {
                Spacer()
                HStack {
                    Text(title)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Capsule()
                        .fill(Color.gray.opacity(0.7))
                        .frame(width: 120, height: 80)
                        .overlay(
                            ZStack {
                                VStack {
                                    Spacer()
                                    HStack{
                                        Text("9,6k")
                                        Image(systemName: "hand.thumbsup.fill")
                                    }
                                    
                                    Spacer()
                                    
                                    HStack{
                                        Text("23m")
                                        Image(systemName: "timer")
                                    }
                                    
                                    Spacer()
                                }
                                .foregroundColor(.white)
                                .padding(6)
                            }
                        )
                    
                }
                
                Text(description)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    CardView(title: "Titre de la Cartouche", description: "Description de la Cartouche. Cela peut être une explication détaillée.", backgroundImage: Image("crepe"))
}
