//
//  StockCellView.swift
//  Stocks
//
//  Created by Maksym Poskannyi on 06.06.2025.
//

import SwiftUI

struct StockCellView: View {
    let stock: StockViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(stock.symbol)
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                Text(stock.name)
                    .opacity(0.4)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 2) {
                Text("\(stock.price, specifier: "%.2f")")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                
                Button {
                    
                } label: {
                    Text(stock.change)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }.frame(maxWidth: 60)
                    .background(changeColor(stock.change))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                
            }
        }
        
    }
}

#Preview {
    StockCellView(stock: StockViewModel(stock: Stock(symbol: "Apple", description: "Apple Inc.", price: 145.23, change: "+3.21")))
}
