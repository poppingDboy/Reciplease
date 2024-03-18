//
//  RecipleaseApp.swift
//  Reciplease
//
//  Created by MARTEAU Dylan on 19/12/2023.
//

import SwiftUI

@main
struct RecipleaseApp: App {
    init() {
        // Enregistrement du transformateur
        StringArrayToDataTransformer.register()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
