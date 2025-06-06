//
//  HomeScreen.swift
//  Stocks
//
//  Created by Mohammad Azam on 1/21/22.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationView {
            SideBarScreen()
                .frame(minWidth: 300, maxWidth: 400)
            NewsAricleListScreen()
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
