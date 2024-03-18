//
//  CoreDataStack.swift
//  Reciplease
//
//  Created by MARTEAU Dylan on 21/02/2024.
//

import Foundation
import CoreData

//class DataController: NSObject {
//class CoreDataStack: NSObject {
//    var managedObjectContext: NSManagedObjectContext
//    
//    init(completionClosure: @escaping () -> ()) {
//        //This resource is the same name as your xcdatamodeld contained in your project
//        guard let modelURL = Bundle.main.url(forResource: "DataModel", withExtension: "momd") else {
//            fatalError("Error loading model from bundle")
//        }
//        // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
//        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
//            fatalError("Error initializing mom from : \(modelURL)")
//        }
//        
//        let psc  = NSPersistentStoreCoordinator(managedObjectModel: mom)
//        
//        managedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
//        managedObjectContext.persistentStoreCoordinator = psc
//        
//        let queue = DispatchQueue.global(qos: DispatchQoS.QoSClass.background)
//        queue.async {
//            guard let docURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last else {
//                fatalError("Unable to resolve document directory")
//            }
//            let storeURL = docURL.appendingPathComponent("DataModel.sqlite")
//            do {
//                try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
//                // The callback block is expected to complete the User Interface and therefore should be presented back on the main
//                // queue so that the user interface does not need to be concerned with which queue this call is coming from.
//                DispatchQueue.main.sync(execute: completionClosure)
//            } catch {
//                fatalError("Error migrating store: \(error)")
//            }
//        }
//    }
//    
//}



final class CoreDataStack {
    // MARK: - Properties
    private let persistentContainerName = "Reciplease"
    
    // MARK: - Singleton
    
    static let sharedInstance = CoreDataStack()
    // MARK: - Public
    
    var viewContext: NSManagedObjectContext {
        return CoreDataStack.sharedInstance.persistentContainer.viewContext
    }
    // MARK: - Private
    private init() {}
    
//    private lazy var persistentContainer: NSPersistentContainer = {
//        let container = NSPersistentContainer(name: persistentContainerName)
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//                fatalError("Unresolved error \(error), \(error.userInfo) for: \(storeDescription.description)")
//            }
//        })
//        return container
//    }()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: persistentContainerName)
        let description = NSPersistentStoreDescription()
        description.shouldMigrateStoreAutomatically = true
        description.shouldInferMappingModelAutomatically = true
        container.persistentStoreDescriptions = [description]

        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    // CoreDataStack.sharedInstance.viewContext
}
