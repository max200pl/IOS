//
//  MapScreen.swift
//  Maps
//
//  Created by Maksym Poskannyi on 01.06.2025.
//

import SwiftUI

struct MapScreen: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        MapView(annotations: appState.places, selectedPlace: appState.selectedPlace) 
    }
}

#Preview {
    MapScreen()
}
