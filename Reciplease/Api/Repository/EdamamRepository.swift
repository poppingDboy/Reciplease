//
//  EdamamRepository.swift
//  Reciplease
//
//  Created by MARTEAU Dylan on 06/02/2024.
//

import Foundation
import Alamofire

class EdamamRepository {
    let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func getRecipesRepo(for ingredients: [String], completion: @escaping (Bool, EdamamModel?) -> Void) {
        let url = "https://api.edamam.com/api/recipes/v2"
        let joinedIngredients = ingredients.joined(separator: ",")
        let parameters: [String: Any] = [
            "app_id": "\(EdamamKey.appId)",
            "app_key": "\(EdamamKey.appKey)",
            "type": "any",
            "q": joinedIngredients
        ]
        
        AF.request(url, parameters: parameters).responseData { response in
            DispatchQueue.main.async {
                guard let data = response.data, response.error == nil else {
                    completion(false, nil)
                    return
                }
                guard let httpResponse = response.response, httpResponse.statusCode == 200 else {
                    completion(false, nil)
                    return
                }
                
                
                // pour tester avec le debug
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let edamamResult = try decoder.decode(EdamamModel.self, from: data)
                    completion(true, edamamResult)
                } catch {
                    print("Erreur de décodage: \(error)")
                    completion(false, nil)
                }
            }
        }
    }
    
}
