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
    
    func getWeatherParis(completion: @escaping (Bool, EdamamModel?) -> Void) {
        let url = "https://api.edamam.com/api/recipes/v2"
        let parameters: [String: Any] = [
            "app_id": "179386f2",
            "app_key": "8ceef13f422d691485ae7f600502f166",
            "type": "any",
            "q": "chicken"
        ]
        
        let urlString = "\(OpenWeatherApi.baseURL)?q=\(city)&APPID=\(accessKey)"
        let url = URL(string: urlString)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
//        AF.request(url, parameters: parameters).responseDecodable(of: EdamamModel.self) { response in
//            guard let edamamResult = response.value else { return }
//            DispatchQueue.main.async {
//                self.listRecipes = edamamResult.hits.map { hit in
//                    let limitedIngredients = hit.recipe.ingredients.map { $0.text }.prefix(4)
//                    return RecipeObject(title: hit.recipe.label,
//                                        ingredients: Array(limitedIngredients),
//                                        timeCook: hit.recipe.totalTime,
//                                        image: hit.recipe.image,
//                                        urlDiretion: hit.recipe.url)
//                }
//            }
//        }
        
        let task = session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completion(false, nil)
                    return
                }
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completion(false,nil)
                    return
                }
                do {
                    let weatherResponse = try JSONDecoder().decode(OpenWeatherModel.self, from: data)
                    completion(true, weatherResponse)
                } catch {
                    completion(false, nil)
                }
            }
        }
        task.resume()
        
    }
    
}





func fetchRecipes() {
    let url = "https://api.edamam.com/api/recipes/v2"
    let parameters: [String: Any] = [
        "app_id": "179386f2",
        "app_key": "8ceef13f422d691485ae7f600502f166",
        "type": "any",
        "q": "chicken"
    ]
    
    AF.request(url, parameters: parameters).responseDecodable(of: EdamamModel.self) { response in
        guard let edamamResult = response.value else { return }
        DispatchQueue.main.async {
            self.listRecipes = edamamResult.hits.map { hit in
                let limitedIngredients = hit.recipe.ingredients.map { $0.text }.prefix(4)
                return RecipeObject(title: hit.recipe.label,
                                    ingredients: Array(limitedIngredients),
                                    timeCook: hit.recipe.totalTime,
                                    image: hit.recipe.image,
                                    urlDiretion: hit.recipe.url)
            }
        }
    }
    
}
