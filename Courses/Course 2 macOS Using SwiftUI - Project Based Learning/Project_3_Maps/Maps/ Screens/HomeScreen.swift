//
//  HomeScreen.swift
//  Maps
//
//  Created by Maksym Poskannyi on 01.06.2025.
//

import SwiftUI

struct HomeScreen: View {
    @AppStorage("useLightMap") var useLightMap: Bool = false
    
    
    var body: some View {
        NavigationView {
            Group {
                SideBar()
                    .frame(minWidth: 300)
                MapScreen()
            }.preferredColorScheme(useLightMap ? .light : .dark)
        }
    }
}


#Preview {
    HomeScreen()
}
