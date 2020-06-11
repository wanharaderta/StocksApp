//
//  StockViewModel.swift
//  StocksApp
//
//  Created by Wanhar on 11/06/20.
//  Copyright © 2020 Wanhar. All rights reserved.
//

import Foundation

struct StockViewModel {
    
    let stock: Stock
    
    var symbol: String {
        return self.stock.symbol.uppercased()
    }
    
    var description: String {
        return self.stock.description
    }
    
    var price: String {
        return String(format: "%.2f", self.stock.price)
    }
    
    var change: String {
        return self.stock.change
    }
}
