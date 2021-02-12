//
//  ListCoreScratchApp.swift
//  Shared
//
//  Created by Stefania Zinno on 12/02/21.
//

import SwiftUI

@main
struct ListCoreScratchApp: App {
    
    let persistentContainer = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistentContainer.container.viewContext)
        }
    }
}
