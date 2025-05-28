//
//  Project_2_RemindersAppApp.swift
//  Project_2_RemindersApp
//
//  Created by Maksym Poskannyi on 28.05.2025.
//

import SwiftUI

@main
struct Project_2_RemindersAppApp: App {
    var body: some Scene {
        WindowGroup {
            let viewContext = CoreDataManager.shared.persistentContainer.viewContext
              
            HomeScreen().environment(
                \.managedObjectContext, viewContext
            )
        }
    }
}
