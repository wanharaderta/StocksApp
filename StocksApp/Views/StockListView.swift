//
//  StockListView.swift
//  StocksApp
//
//  Created by Wanhar on 16/06/20.
//  Copyright © 2020 Wanhar. All rights reserved.
//

import SwiftUI

struct StockListView: View {
    
    let stocks: [StockViewModel]
    
    var body: some View {
        List(self.stocks, id: \.symbol) { stock in
            StockCellView(stock: stock)
        }
    }
}

struct StockCellView: View {
    let stock: StockViewModel
    
    var body: some View {
        return HStack {
            VStack(alignment: .leading) {
                Text(stock.symbol)
                    .font(.custom("Arial", size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                
                Text(stock.description)
                    .font(.custom("Arial", size: 18))
                    .foregroundColor(Color.gray)
            }
            
            Spacer()
            
            VStack {
                Text("\(stock.price)")
                    .foregroundColor(Color.white)
                    .font(.custom("Arial", size: 22))
                
                Button(stock.change){
                    
                }.frame(width: 75)
                    .padding(5)
                    .background(Color.red)
                    .foregroundColor(Color.white)
                    .cornerRadius(6)
            }
        }
    }
}

#if DEBUG
struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        let stock   = Stock(symbol: "Symbol", description: "Description", price: 0.0, change: "Change")
        return StockListView(stocks: [StockViewModel(stock: stock)])
    }
}
#endif
