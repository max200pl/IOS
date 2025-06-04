//
//  MapsApp.swift
//  Maps
//
//  Created by Maksym Poskannyi on 01.06.2025.
//

import SwiftUI

@main
struct MapsApp: App {
    var body: some Scene {
        WindowGroup {
            let appState = AppState()
            
            HomeScreen()
                .environmentObject(appState)
        }.commands {
            CommandGroup(after: .appInfo){
                Button("Preferences"){
                    PreferencesScreen()
                        .openInWindwo(title: "Preferences", sender: self)
                }
            }
        }
    }
}
