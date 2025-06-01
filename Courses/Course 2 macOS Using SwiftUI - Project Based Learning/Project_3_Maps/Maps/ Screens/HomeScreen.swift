//
//  HomeScreen.swift
//  Maps
//
//  Created by Maksym Poskannyi on 01.06.2025.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationView {
            SideBar()
                .frame(minWidth: 300)
            MapScreen()
        }
    }
}


#Preview {
    HomeScreen()
}
