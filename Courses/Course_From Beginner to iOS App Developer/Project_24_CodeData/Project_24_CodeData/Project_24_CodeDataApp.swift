//
//  Project_24_CodeDataApp.swift
//  Project_24_CodeData
//
//  Created by Maksym Poskannyi on 21.05.2025.
//

import SwiftUI

@main
struct Project_24_CodeDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
