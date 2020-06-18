//
//  WebService.swift
//  StocksApp
//
//  Created by Wanhar on 10/06/20.
//  Copyright © 2020 Wanhar. All rights reserved.
//

import Foundation

class WebService {
    
    let BASE_URL : String = "https://silicon-rhinoceros.glitch.me/"
    
    func getTopNews(completion : @escaping (([Article]?) -> Void)){
        guard let url   = URL(string: "\(BASE_URL)top-news") else {
            fatalError("URL is not correct")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data  = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let article = try? JSONDecoder().decode([Article].self, from: data)
            DispatchQueue.main.async {
                completion(article)
            }
            
        }.resume()
    }
    
    
    func getStocks(completion : @escaping (([Stock]?) -> Void)) {
        guard let url   = URL(string: "\(BASE_URL)stocks") else {
            fatalError("URL is not correct")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data  = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let stocks  = try? JSONDecoder().decode([Stock].self, from: data)
            //stocks == nil ? completion(nil) : completion(stocks)
            DispatchQueue.main.async {
                completion(stocks)
            }
            
        }.resume()
        
    }
}
