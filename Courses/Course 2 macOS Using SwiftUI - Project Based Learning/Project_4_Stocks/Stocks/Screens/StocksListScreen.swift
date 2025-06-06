//
//  StocksListScreen.swift
//  Stocks
//
//  Created by Maksym Poskannyi on 06.06.2025.
//

import SwiftUI

struct StocksListScreen: View {
    @State private var search: String = ""
    @StateObject var vm: StockListViewModel
    
    init(vm: StockListViewModel) {
        self._vm = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        VStack {
            StockListView(stocks: vm.stocks)
                .searchable(text: $search, placement:  .sidebar)
        }.task {
            await vm.getStocks()
        }
    }
}

#Preview {
    StocksListScreen(vm:StockListViewModel(appState: AppState( )))
}
