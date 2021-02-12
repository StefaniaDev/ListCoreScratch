//
//  Persistence.swift
//  ListCoreScratch
//
//  Created by Stefania Zinno on 12/02/21.
//

import Foundation
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Dish")
        container.loadPersistentStores { (description, error) in
            if let error = error as NSError? {
                //handle error
                fatalError("Unknown Error \(error)")
            }
        }
    }
}

