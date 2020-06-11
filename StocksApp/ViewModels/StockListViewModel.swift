//
//  StockListViewModel.swift
//  StocksApp
//
//  Created by Wanhar on 11/06/20.
//  Copyright © 2020 Wanhar. All rights reserved.
//

import Foundation

class StockListViewModel : ObservableObject{
    
    var searchTerm: String       = ""
    @Published var stocks: [StockViewModel] = [StockViewModel]()
    
    func load() {
        fetchStocks()
    }
    
    private func fetchStocks(){
        
        WebService().getStocks { stocks in
            if let stocks   = stocks {
                DispatchQueue.main.async {
                    self.stocks = stocks.map(StockViewModel.init)
                }
                
            }
        }
    }
}
