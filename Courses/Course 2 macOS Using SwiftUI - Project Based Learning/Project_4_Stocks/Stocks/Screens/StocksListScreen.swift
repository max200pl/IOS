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
    
    let timer = Timer.publish(every: 5.0, on: .main, in: .common).autoconnect()
    
    init(vm: StockListViewModel) {
        self._vm = StateObject(wrappedValue: vm)
    }
    var stocks: [StockViewModel] {
        if !search.isEmpty {
            return vm.stocks.filter { $0.symbol.starts(with: search.uppercased())}
        } else {
            return vm.stocks
        }
    }
    
    var body: some View {
        VStack {
            StockListView(stocks: stocks)
                .searchable(text: $search, placement:  .sidebar)
        }.task {
            await vm.getStocks()
        }
        
        .onReceive(timer) { _ in
            Task {
                await vm.getStocks()
            }
        }
    }
}

#Preview {
    
    StocksListScreen(vm: StockListViewModel(stockState: StocksState()))
}
