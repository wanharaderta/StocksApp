//
//  StockListViewModel.swift
//  StocksApp
//
//  Created by Wanhar on 11/06/20.
//  Copyright © 2020 Wanhar. All rights reserved.
//

import Foundation
import SwiftUI

class StockListViewModel : ObservableObject{
    
    @Published var dragOffset: CGSize       = CGSize(width: 0, height: 650)
    @Published var searchTerm: String       = ""
    @Published var stocks: [StockViewModel] = [StockViewModel]()
    @Published var news: [NewsViewModel]    = [NewsViewModel]()
    
    func load() {
        fetchNews()
        fetchStocks()
    }
    
    private func fetchNews(){
        WebService().getTopNews { news in
            if let news = news {
                DispatchQueue.main.async {
                    self.news   = news.map(NewsViewModel.init)
                }
            }
        }
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
