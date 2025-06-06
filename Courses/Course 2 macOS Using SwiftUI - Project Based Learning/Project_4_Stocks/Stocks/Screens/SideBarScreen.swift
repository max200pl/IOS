//
//  SideBarScreen.swift
//  Stocks
//
//  Created by Mohammad Azam on 1/21/22.
//

import SwiftUI

struct SideBarScreen: View {
    @EnvironmentObject var appState: AppState
    
    
    var body: some View {
        VStack(alignment: .leading){
            StocksListScreen(vm: StockListViewModel(appState: appState))
        }
    }
}

struct SideBarScreen_Previews: PreviewProvider {
    static var previews: some View {
        SideBarScreen()
            .environmentObject(AppState())
    }
}
