//
//  SideBar.swift
//  Maps
//
//  Created by Maksym Poskannyi on 01.06.2025.
//

import SwiftUI

struct SideBar: View {
    private var vm = SearchResultsViewModel()
    @EnvironmentObject var appState: AppState
    
    @State private var search: String = ""
    
    var body: some View {
        VStack {
            SearchResultList(places: appState.places ){ place in
                appState.selectedPlace = place
            }
        }.searchable(text: $search, placement: .sidebar, prompt: "Search Maps")
            .onChange(of: search) { _, value in
                vm.search(text: value) { places in
                    appState.places = places
                }
            }
            .padding()
        
        Text("SideBar")
    }
}

#Preview {
    SideBar()
}
