//
//  CardView.swift
//  Reciplease
//
//  Created by MARTEAU Dylan on 03/01/2024.
//

import SwiftUI

struct CardView: View {
    var title: String = "Titre de la Cartouche"
    var description: [String] = ["Description de la Cartouche. Cela peut être une explication détaillée."]
    var backgroundImage: URL?
    var timeCook: Int = 1
    
    
    init(title: String, description: [String], backgroundImage: URL, timeCook: Int) {
        self.title = title
        self.description = description
        self.backgroundImage = backgroundImage
        self.timeCook = timeCook
    }
    
    var body: some View {
        ZStack {
            if let safeBackgroundImage = backgroundImage {
                // CachedAsyncImage(url: logoURL)
                // CachedAsyncImage(urlRequest: logoURLRequest, urlCache: .imageCache)
                AsyncImage(url: safeBackgroundImage) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                    case .failure(_):
                        Image(systemName: "ant.circle.fill")
                            .foregroundColor(.teal)
                            .opacity(0.6)
                    case .empty:
                        Image(systemName: "photo.circle.fill")
                            .foregroundColor(.teal)
                            .opacity(0.6)
                    @unknown default:
                        ProgressView()
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            } else {
                Image(systemName: "photo.circle.fill")
                    .foregroundColor(.teal)
                    .opacity(0.6)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Spacer()
                HStack {
                    Text(title)
                        .background(Color.black.opacity(0.6))
                        .edgesIgnoringSafeArea(.all)
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
                }
                .background(Color.black.opacity(0.6))
                .edgesIgnoringSafeArea(.all)
                .font(.system(size: 16))
                .foregroundColor(.white)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    CardView(title: "Titre de la Cartouche", description: ["Description de la Cartouche. Cela peut être une explication détaillée."], backgroundImage: URL(string: "http://google.fr/")!, timeCook: 2)
}

extension URLCache {
    
    static let imageCache = URLCache(memoryCapacity: 512_000_000, diskCapacity: 10_000_000_000)
}
