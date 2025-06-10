//
//  ContentView.swift
//  StocksMenuBar
//
//  Created by Maksym Poskannyi on 10.06.2025.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm: StockListViewModel
    
    init(vm: StockListViewModel) {
        self._vm = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Stocks").padding()
            
            List(vm.stocks, id: \.symbol) { stock in
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Text(stock.symbol)
                            .fontWeight(.semibold)
                        Text(stock.description)
                            .opacity(0.4)
                        Divider()
                    }
                   
                    Spacer()
                    Text(stock.price.formatAsCurrency())
                }
            }.task {
                await vm.populateStocks()
            }
            
        }.frame(width: 300, height: 300)
    }
}
 

#Preview {
    ContentView(vm: StockListViewModel())
}
