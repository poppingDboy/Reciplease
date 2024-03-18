////
////  StringArrayToDataTransformer.swift
////  Reciplease
////
////  Created by MARTEAU Dylan on 07/03/2024.
////
//
//import Foundation
//
//@objc(StringArrayToDataTransformer)
//final class StringArrayToDataTransformer: NSSecureUnarchiveFromDataTransformer {
//    // Les classes autorisées à transformer
//    override static var allowedTopLevelClasses: [AnyClass] {
//        return [NSArray.self, NSString.self]
//    }
//    
//    // Méthode pour enregistrer le transformateur
//    static func register() {
//        let transformer = StringArrayToDataTransformer()
//        ValueTransformer.setValueTransformer(transformer, forName: NSValueTransformerName("StringArrayToDataTransformer"))
//    }
//}
