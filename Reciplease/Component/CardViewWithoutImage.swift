//
//  CardView.swift
//  Reciplease
//
//  Created by MARTEAU Dylan on 03/01/2024.
//

import SwiftUI

struct CardViewWithoutImage: View {
    var title: String = "Titre de la Cartouche"
    var description: [String] = ["Description de la Cartouche. Cela peut être une explication détaillée."]
    var timeCook: Int = 1
    
    let backgroundImage = Image("crepe")
    
    init(title: String, description: [String], timeCook: Int) {
        self.title = title
        self.description = description
        self.timeCook = timeCook
    }
    
    var body: some View {
        ZStack {
            backgroundImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 8) {
                Spacer()
                HStack {
                    Text(title)
                        .background(Color.black.opacity(0.6))
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Capsule()
                        .fill(Color.black.opacity(0.6))
                        .frame(width: 120, height: 80)
                        .overlay(
                            ZStack {
                                VStack {
                                    
                                    Spacer()
                                    
                                    HStack{
                                        Text("\(timeCook)")
                                        Image(systemName: "timer")
                                    }
                                    
                                    Spacer()
                                }
                                .foregroundColor(.white)
                                .padding(6)
                            }
                        )
                    
                }
                
                ForEach(description, id: \.self) { description in
                    Text(description)
                        .background(Color.black.opacity(0.6))
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    CardViewWithoutImage(title: "Titre de la Cartouche", description: ["Description de la Cartouche. Cela peut être une explication détaillée."], timeCook: 2)
}

