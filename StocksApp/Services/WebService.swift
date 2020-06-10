//
//  WebService.swift
//  StocksApp
//
//  Created by Wanhar on 10/06/20.
//  Copyright © 2020 Wanhar. All rights reserved.
//

import Foundation

class WebService {
    
    func getStocks(completion : @escaping (([Stock]?) -> Void)) {
        
        guard let url   = URL(string: "https://silicon-rhinoceros.glitch.me/stocks") else {
            fatalError("URL is not correct")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data  = data, error == nil else {
                completion(nil)
                return
            }
            
            let stocks  = try? JSONDecoder().decode([Stock].self, from: data)
            stocks == nil ? completion(nil) : completion(stocks)
            
        }.resume()
        
    }
}
